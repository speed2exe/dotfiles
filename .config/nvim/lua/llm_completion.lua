local MAX_LINES = 256

local function text_before_cursor()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local current_line = vim.api.nvim_get_current_line()
  local before_text = current_line:sub(1, cursor_pos[2])

  local start_line = math.max(0, cursor_pos[1] - 1 - MAX_LINES)
  local lines = vim.api.nvim_buf_get_lines(0, start_line, cursor_pos[1] - 1, false)
  table.insert(lines, before_text)
  return table.concat(lines, '\n')
end

local function text_after_cursor()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local current_line = vim.api.nvim_get_current_line()
  local lines = { current_line:sub(cursor_pos[2] + 1) }

  local end_line = math.min(cursor_pos[1] + MAX_LINES, vim.api.nvim_buf_line_count(0))
  local remaining = vim.api.nvim_buf_get_lines(0, cursor_pos[1], end_line, false)
  vim.list_extend(lines, remaining)
  return table.concat(lines, '\n')
end

local completion_job_id = nil

-- usage: fim_completion <before_cursor> <after_cursor>
local function fim_completion(before_cursor, after_cursor, callback)
  local cmd = ". ~/.completion.bash && fim_completion "
    .. vim.fn.shellescape(before_cursor) .. " "
    .. vim.fn.shellescape(after_cursor)

  completion_job_id = vim.fn.jobstart({ "bash", "-c", cmd }, {
    stdout_buffered = true,
    on_stdout = vim.schedule_wrap(function(_, data)
      completion_job_id = nil
      if data and #data > 0 then
        callback(data)
      end
    end),
    on_exit = vim.schedule_wrap(function()
      completion_job_id = nil
    end),
  })
end

local IDLE_DELAY_MS = 256
local ns_id = vim.api.nvim_create_namespace("llm_completion")

-- Store completion data in a buffer-local variable so the keymap can access it
local function set_completion(completion_lines)
  if not completion_lines or #completion_lines == 0 or completion_lines[1] == "" then
    return
  end

  -- Store for the keymap to read
  vim.b.llm_completion_lines = completion_lines

  -- Clear any existing extmarks in our namespace
  vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)

  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row = cursor_pos[1] - 1
  local col = cursor_pos[2]

  vim.api.nvim_buf_set_extmark(0, ns_id, row, col, {
    virt_text = { { completion_lines[1], "Comment" } },
    virt_text_pos = "overlay",
    hl_mode = "combine",
  })

  if #completion_lines > 1 then
    local virt_lines = {}
    for i = 2, #completion_lines do
      table.insert(virt_lines, { { completion_lines[i], "Comment" } })
    end
    vim.api.nvim_buf_set_extmark(0, ns_id, row, 0, {
      virt_lines = virt_lines,
      hl_mode = "combine",
    })
  end
end

-- Dismiss: clear extmarks without inserting
local function dismiss_completion()
  if completion_job_id then
    vim.fn.jobstop(completion_job_id)
    completion_job_id = nil
  end
  vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
  vim.b.llm_completion_lines = nil
end

local function setup_completion_in_insert_mode()
  local before_cursor = text_before_cursor()
  local after_cursor = text_after_cursor()
  local buf = vim.api.nvim_get_current_buf()

  dismiss_completion()

  fim_completion(before_cursor, after_cursor, function(completion_lines)
    if vim.api.nvim_get_current_buf() == buf
      and vim.api.nvim_get_mode().mode == "i" then
      set_completion(completion_lines)
    end
  end)
end

-- Accept: insert the stored completion text at cursor and clear extmarks
local function accept_completion()
  local lines = vim.b.llm_completion_lines
  if not lines or #lines == 0 then
    return
  end

  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor_pos[1] - 1, cursor_pos[2]
  local current_line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]
  local before = current_line:sub(1, col)
  local after = current_line:sub(col + 1)

  local new_lines = { before .. lines[1] }
  for i = 2, #lines do
    table.insert(new_lines, lines[i])
  end
  new_lines[#new_lines] = new_lines[#new_lines] .. after
  vim.api.nvim_buf_set_lines(0, row, row + 1, false, new_lines)
  vim.api.nvim_win_set_cursor(0, { row + #lines, #lines == 1 and col + #lines[1] or #lines[#lines] })

  -- Clear the extmarks and stored data
  vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
  vim.b.llm_completion_lines = nil
end

-- Set up keymaps (buffer-local so they only apply when completions are active)
-- You can set these globally or conditionally
vim.keymap.set("i", "<Tab>", function()
  if vim.b.llm_completion_lines then
    accept_completion()
  else
    -- Fall back to default Tab behavior
    -- If you use a plugin for completion, call its accept here
    local key = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
    vim.api.nvim_feedkeys(key, "n", false)
  end
end, { desc = "Accept LLM completion or Tab" })

-- Timer management
local timer = vim.uv.new_timer() -- libuv timer (non-blocking)
local function start_or_restart_timer()
  if completion_job_id then
    vim.fn.jobstop(completion_job_id)
    completion_job_id = nil
  end
  timer:stop()                   -- cancel any previous countdown
  timer:start(
    IDLE_DELAY_MS,               -- delay in milliseconds
    0,                           -- repeat = 0 → fire once
    vim.schedule_wrap(function()
      if vim.api.nvim_get_mode().mode == "i" then
        setup_completion_in_insert_mode()
      end
    end)
  )
end

local group = vim.api.nvim_create_augroup("LlmCompletion", { clear = true })
vim.api.nvim_create_autocmd("TextChangedI", {
  group    = group,
  callback = start_or_restart_timer,
})
vim.api.nvim_create_autocmd("TextChangedP", {
  group    = group,
  callback = start_or_restart_timer,
})
vim.api.nvim_create_autocmd("InsertEnter", {
  group    = group,
  callback = start_or_restart_timer,
})

vim.api.nvim_create_autocmd({ "CursorMovedI", "InsertLeave" }, {
  group = group,
  callback = function()
    timer:stop()
    if vim.b.llm_completion_lines then
      dismiss_completion()
    end
  end,
})

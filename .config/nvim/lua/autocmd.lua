local vim = vim
local function directory_exists(path)
  return vim.fn.isdirectory(path) == 1
end

local function create_directory_if_not_exists(path)
  if not directory_exists(path) then
    vim.fn.mkdir(path, 'p')
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    -- remove trailing whitespace
    vim.cmd([[%s/\s\+$//e]])

    -- create directory if it doesn't exist
    local dir = vim.fn.expand("%:p:h")
    create_directory_if_not_exists(dir)
  end
})

-- background task to poll for LSP status
local has_message = false
local timer = vim.loop.new_timer()
timer:start(0, 1000, vim.schedule_wrap(function()
  local status = vim.lsp.status()
  if #status > 0 then
    has_message = true
    print(status)
  else
    if has_message then
      print('\n')
      has_message = false
    end
  end
end))

-- go to last cursor position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local cusor_pos = vim.api.nvim_win_get_cursor(0)
    if cusor_pos[1] == 1 and cusor_pos[2] == 0 then
      vim.cmd([[keepjumps normal! `"]])
    end
  end
})

-- module store custom created functions

local M = {}
local vim = vim

M.toggle_quickfix = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      vim.cmd "cclose"
      return
    end
  end
  vim.cmd "copen"
end

M.open_term_at_file_dir = function()
  vim.cmd('lcd ' .. vim.fn.expand('%:p:h'))
  vim.cmd('terminal')
  vim.cmd('startinsert')
  vim.cmd('lcd -')
end

-- https://www.reddit.com/r/neovim/comments/1b1sv3a/function_to_get_visually_selected_text/
M.get_visual_selection_text = function()
  local start_pos = vim.fn.getpos('v')
  local end_pos = vim.fn.getpos('.')
  local srow, scol = start_pos[2], start_pos[3]
  local erow, ecol = end_pos[2], end_pos[3]

  -- visual line mode
  if vim.fn.mode() == 'V' then
    if srow > erow then
      return vim.api.nvim_buf_get_lines(0, erow - 1, srow, true)
    else
      return vim.api.nvim_buf_get_lines(0, srow - 1, erow, true)
    end
  end

  -- regular visual mode
  if vim.fn.mode() == 'v' then
    if srow < erow or (srow == erow and scol <= ecol) then
      return vim.api.nvim_buf_get_text(0, srow - 1, scol - 1, erow - 1, ecol, {})
    else
      return vim.api.nvim_buf_get_text(0, erow - 1, ecol - 1, srow - 1, scol, {})
    end
  end

  -- visual block mode
  if vim.fn.mode() == '\22' then
    local lines = {}
    if srow > erow then
      srow, erow = erow, srow
    end
    if scol > ecol then
      scol, ecol = ecol, scol
    end
    for i = srow, erow do
      table.insert(
        lines,
        vim.api.nvim_buf_get_text(0, i - 1, math.min(scol - 1, ecol), i - 1, math.max(scol - 1, ecol), {})[1]
      )
    end
    return lines
  end
end

return M

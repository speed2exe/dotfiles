-- old setup before fork
local saga = require 'lspsaga'
saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = '<CR>', vsplit = 'v',split = 'x',quit = '<ESC>',scroll_down = '<C-d>', scroll_up = '<C-u>' -- quit can be a table
    },
    code_action_keys = {
        quit = '<ESC>', exec = '<CR>'
    },
    rename_action_keys = {
        quit = '<ESC>', exec = '<CR>'  -- quit can be a table
    },
    definition_preview_icon = '  ',
    --"single" "double" "round" "plus"
    border_style = "single",
    rename_prompt_prefix = '➤',
    --if you don't use nvim-lspconfig you must pass your server name and
    --the related filetypes into this table like server_filetype_map = {metals = {'sbt', 'scala'}},
    server_filetype_map = {},
}

-- new setup after fork
--local lspsaga = require 'lspsaga'
--
--lspsaga.setup { -- defaults ...
--  debug = false,
--  use_saga_diagnostic_sign = true,
--  -- diagnostic sign
--  error_sign = "",
--  warn_sign = "",
--  hint_sign = "",
--  infor_sign = "",
--  dianostic_header_icon = "   ",
--  -- code action title icon
--  code_action_icon = " ",
--  code_action_prompt = {
--    enable = true,
--    sign = true,
--    sign_priority = 40,
--    virtual_text = true,
--  },
--  finder_definition_icon = "  ",
--  finder_reference_icon = "  ",
--  max_preview_lines = 10,
--  finder_action_keys = {
--    open = "o",
--    vsplit = "v",
--    split = "x",
--    quit = "q",
--    scroll_down = "<C-f>",
--    scroll_up = "<C-b>",
--  },
--  code_action_keys = {
--    quit = "q",
--    exec = "<CR>",
--  },
--  rename_action_keys = {
--    quit = "q",
--    exec = "<CR>",
--  },
--  definition_preview_icon = "  ",
--  border_style = "single",
--  rename_prompt_prefix = "➤",
--  server_filetype_map = {},
--}

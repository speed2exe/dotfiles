local saga = require 'lspsaga'

-- old setup before fork
--saga.init_lsp_saga {
--    debug = false,
--    use_saga_diagnostic_sign = true,
--    error_sign = '',
--    warn_sign = '',
--    hint_sign = '',
--    infor_sign = '',
--    dianostic_header_icon = '   ',
--    code_action_icon = ' ',
--    code_action_prompt = {
--        enable = true,
--        sign = true,
--        sign_priority = 40,
--        virtual_text = true,
--    },
--    finder_definition_icon = '  ',
--    finder_reference_icon = '  ',
--    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
--    finder_action_keys = {
--        open = '<CR>', vsplit = 'v',split = 'x',quit = '<ESC>',scroll_down = '<C-d>', scroll_up = '<C-u>' -- quit can be a table
--    },
--    code_action_keys = {
--        quit = '<ESC>', exec = '<CR>'
--    },
--    rename_action_keys = {
--        quit = '<ESC>', exec = '<CR>'  -- quit can be a table
--    },
--    definition_preview_icon = '  ',
--    --"single" "double" "round" "plus"
--    border_style = "single",
--    rename_prompt_prefix = '➤',
--    --if you don't use nvim-lspconfig you must pass your server name and
--    --the related filetypes into this table like server_filetype_map = {metals = {'sbt', 'scala'}},
--    server_filetype_map = {},
--}

-- new setup after fork
saga.setup {
    debug = false,
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    diagnostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 40,
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

local map = nvim_buf_set_keymap
map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})

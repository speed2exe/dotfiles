local saga = require 'lspsaga'
saga.init_lsp_saga{
    finder_action_keys = {
        open = '<CR>',
        vsplit = 'v',
        split = 'x',
        quit = '<ESC>',
        scroll_down = '<C-D>',
        scroll_up = '<C-U>'
    },
    code_action_keys = {
        quit = '<ESC>',
        exec = '<CR>'
    },
    rename_action_keys = {
        quit = '<C-C>',
        exec = '<CR>'
    },
}

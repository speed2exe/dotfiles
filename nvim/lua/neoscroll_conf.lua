require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {
        '<C-u>', '<C-d>', '<C-b>', '<C-f>',
        '<C-y>', '<C-e>', 'zt', 'zz', 'zb'
    },
    hide_cursor = false,            -- Hide cursor while scrolling
    stop_eof = true,                -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = true,     -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = true,       -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = false,   -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = "sine",       -- Default easing function
    pre_hook = nil,                 -- Function to run before the scrolling animation starts
    post_hook = nil,                -- Function to run after the scrolling animation ends
    performance_mode = false,       -- Disable "Performance Mode" on all buffers.
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
t['<C-U>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
t['<C-D>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}}
-- Use the "circular" easing function
t['<C-B>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '200'}}
t['<C-F>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '200'}}
-- PasS "nil" to disable the easing animation (constant scrolling speed)
t['<C-Y>'] = {'scroll', {'-0.10', 'false', '50'}}
t['<C-E>'] = {'scroll', { '0.10', 'false', '50'}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'100'}}
t['zz']    = {'zz', {'50'}}
t['zb']    = {'zb', {'100'}}

require('neoscroll.config').set_mappings(t)

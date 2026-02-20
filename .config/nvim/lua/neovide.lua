vim.g.neovide_opacity = 0.5
vim.g.transparency = 0.5
vim.g.neovide_refresh_rate = 120
vim.o.guifont = "IosevkaTerm Nerd Font:h14"

-- https://github.com/neovide/neovide/issues/1602
vim.keymap.set("c", "<D-v>", "<C-r>+")
vim.keymap.set("i", "<D-v>", "<C-r>+")

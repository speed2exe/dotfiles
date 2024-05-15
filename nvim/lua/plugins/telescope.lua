return {
  'nvim-telescope/telescope.nvim',
  config = function()
    require('telescope').setup {
      defaults = {
        layout_config = {
          height = .99,
          width = .99,
        },
        -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        borderchars = { "", "", "", "", "", "", "", "" },
      },
      pickers = {
        live_grep = {
          additional_args = function()
            return {
              "--no-ignore",
              "--hidden",
            }
          end
        },
        find_files = {
          no_ignore = true,
          hidden = true,
        },
      },
    }

    require('telescope').load_extension('fzf')
  end
}

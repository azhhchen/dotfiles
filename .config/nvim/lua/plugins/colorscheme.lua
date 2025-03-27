return {
  {
    "craftzdog/solarized-osaka.nvim",
    -- The event is for quick startuptime. If you find the theme blinking at startup unbearable
    -- or encounter any bugs, please consider commenting it out.
    event = "UIEnter",
    config = function()
      require("solarized-osaka").setup({
        style = "night",
        transparent = true,
        styles = { -- I don't like italic
          comments = { italic = false },
          keywords = { italic = false }
        }
      })
      vim.cmd([[colorscheme solarized-osaka]])
    end
  },
  { -- VSCode theme
    -- Remember change lualine theme for consistent
    "Mofiqul/vscode.nvim",
    enabled = false,
    config = function()
      require("vscode").setup({
        transparent = false,
        italic_comments = false,
        terminal_colors = true,
      })
    end
  }
}

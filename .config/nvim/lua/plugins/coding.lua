return {
  { -- Completeion
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    -- enabled = false, -- For debugging
    event = "InsertEnter",
    version = '1.*',
    opts_extend = { "sources.default" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      enabled = function()
        -- Disabled in filetype
        local filetype = vim.bo[0].filetype
        if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
          return false
        end
        return true
      end,
      appearance = { nerd_font_variant = "mono" },
      completion = { documentation = { auto_show = false } },
      cmdline = { enabled = false },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      keymap = { -- See :h blink-cmp-config-keymap
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
    end,
  },
  { -- Autopairs
    "echasnovski/mini.pairs",
    version = false,
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    }
  },
  { -- Comments
    "echasnovski/mini.comment",
    version = false,
    dependencies = {
      { -- This require treesitter
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        opts = { enable_autocmd = false },
      }
    },
    keys = {
      { "<leader>/", desc = "Comment", mode = { "n" , "v" } },
      { "<leader>//", desc = "Comment toggle current line" }
    },
    opts = {
      mappings = {
        -- Toggle comment
        -- exampe: `<Space>/ip` - comment inner paragraph
        comment = '<leader>/',
        comment_line = '<leader>//', -- Toggle current line
        comment_visual = '<leader>/', -- Visual model
        textobject = '<leader>/', -- Treat this as a vim-textobject
      },
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    }
  },
  { -- Surround
    "echasnovski/mini.surround",
    version = false,
    keys = {
      { "sa", desc = "Add Surrounding", mode = { "n", "v" } },
      { "sd", desc = "Delete Surrounding" },
      { "sf", desc = "Find Right Surrounding" },
      { "sF", desc = "Find Left Surrounding" },
      { "sh", desc = "Highlight Surrounding" },
      { "sr", desc = "Replace Surrounding" },
      { "sn", desc = "Update `MiniSurround.config.n_lines`" },
    },
    opts = {
      highlight_duration = 300,
    }
  },
}

return { -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    -- enabled = false, -- For debugging
    dependencies = {
      "folke/snacks.nvim",
      "saghen/blink.cmp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 5,
          source = "if_many",
          prefix ="●",
        },
        severity_sort = true,
        float = {
          style = "minimal",
          source = "always",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostic = {
                globals = { "vim" },
              },
              workspace = {
                -- make language server aware of runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        rust_analyzer = {},
      },
    },
    config = function(_, opts)

      -- Diagnostic symbols
      if vim.fn.has("nvim-0.10.0") == 0 then
        if type(opts.diagnostics.signs) ~= "boolean" then
          for severity, icon in pairs(opts.diagnostics.signs.text) do
            local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
            name = "DiagnosticSign" .. name
            vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
          end
        end
      end
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      -- NOTE: If you are on Neovim 0.11.0+, you can use `vim.lsp.config` simply.
      -- Check out https://github.com/neovim/neovim/pull/31031

      -- LSP capabilities
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      -- LSP keymap
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, silent = true, desc = "LSP: " .. desc })
          end

          -- LSP Start / Stop / Restart
          map("<leader>l+", ":LspStart<cr>" ,"Start")
          map("<leader>l-", ":LspStop<cr>","Stop")
          map("<leader>l=", ":LspRestart<cr>","Restart")

          -- Snacks picker
          map("gd", Snacks.picker.lsp_definitions, "Goto Definition")
          map("gD", Snacks.picker.lsp_declarations, "Goto Declaration")
          map("gr", Snacks.picker.lsp_references, "References")
          map("gI", Snacks.picker.lsp_implementations, "Goto Implementation")
          map("gy", Snacks.picker.lsp_type_definitions, "Goto T[y]pe Definition")
          map("<leader>lc", Snacks.picker.lsp_config, "Config")
          map("<leader>ls", Snacks.picker.lsp_symbols, "Symbols")
          map("<leader>lS", Snacks.picker.lsp_workspace_symbols, "Workspace Symbols")

          -- Neovim lsp builtin
          map("K", vim.lsp.buf.hover, "Hover")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
          map("<leader>cf", vim.lsp.buf.format, "Format")

        end,
      })
    end,

  },
  { -- For managing lsp
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", config = function() end },
    cmd = "Mason",
    keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "rust-analyzer",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end
  }
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",  -- Add this dependency
    },
    config = function()
      -- Mason setup
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "clangd",
          "html",
          "jsonls",
          "lua_ls",
          "powershell_es",
          "pyright",
          "ruff",
          "sqlls",
          "taplo",
          "yamlls",
          "vimls",
          "lemminx",
          "diagnosticls",
          "marksman",
        },
      })

      -- Get capabilities from nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- LSP servers configuration 
      local lsp = vim.lsp

      -- Python LSP 
      lsp.config.pyright = {
        capabilities = capabilities,
      }

      -- C/C++ LSP
      lsp.config.clangd = {
        capabilities = capabilities,
      }

      -- Bash LSP
      lsp.config.bashls = {
        capabilities = capabilities,
      }

      -- POWERSHELL
      lsp.config.powershell_es = {
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
        capabilities = capabilities,
      }

      -- YAML
      lsp.config.yamlls = {
        capabilities = capabilities,
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      }

      -- JSON
      lsp.config.jsonls = {
        capabilities = capabilities,
      }

      -- TOML
      lsp.config.taplo = {
        capabilities = capabilities,
      }

      -- LUA (Neovim)
      lsp.config.lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("",true),
              checkThirdParty = false,
            },
            telemetry = { enbaled = false },
          },
        },
      }

      -- VIMSCRIPT
      lsp.config.vimls = {
        capabilities = capabilities,
      }

      -- SQL (Postgres + MySQL)
      lsp.config.sqlls = {
        capabilities = capabilities,
      }

      -- Markdown LSP
      lsp.config.marksman = {
        capabilities = capabilities,
      }

      -- XML LSP
      lsp.config.lemminx = {
        capabilities = capabilities,
      }

      -- Enable all LSP servers
      lsp.enable({
        "pyright",
        "clangd",
        "bashls",
        "powershell_es",
        "yamlls",
        "jsonls",
        "taplo",
        "lua_ls",
        "vimls",
        "sqlls",
        "marksman",
        "lemminx",
      })

      -- Disable builtin LSP formatting 
      -- Conform plugin handles all LSP formatting
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end
        end,
      })
    end,
  },
}

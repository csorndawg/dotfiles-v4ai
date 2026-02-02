return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason setup
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",	    -- bash
          "clangd",	    -- c/c++
          "html",
          "jsonls",
          "lua_ls",	    -- lua
          "powershell_es",	-- powershell
          "pyright",	-- python types only
          "ruff",   	-- everything else besides python types
          "sqlls",    -- SQL
          "taplo",    -- TOML
          "yamlls",
          "vimls",    -- vimscript
          "lemminx",  -- xml
          --"awk_ls",
          --"copilot",
          "diagnosticls",   -- diagnostics integrates w/ linters
            --"docker_compose_language_service",
            --"docker_language_service",
            --"dockerls",
            --"jinja_lsp",		-- 
            --"jqls",		-- JQ
            --"just",		-- just
            --"lsp_ai",		-- 
          "marksman",   -- markdown
          --"postgres_lsp",		-- 
        },
      })

      -- LSP servers configuration 
      local lsp = vim.lsp

      -- Python LSP 
      lsp.config.pyright = {}

      -- C/C++ LSP
      lsp.config.clangd = {}

      -- Bash LSP
      lsp.config.bashls = {}

      -- POWERSHELL
      lsp.config.powershell_es = {
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
      }

      -- YAML
      lsp.config.yamlls = {
				settings = {
					yaml = {
						keyOrdering = false,
					},
				},
			}
      -- JSON
      lsp.config.jsonls = {}

      -- TOML
      lsp.config.taplo = {}

      -- LUA (Neovim)
			lsp.config.lua_ls = {
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
			lsp.config.vimls = {}

      -- SQL (Postgres + MySQL)
			lsp.config.sqlls = {}
--       lspconfig.sqlls.setup({
--         settings = {
--           sqlLanguageServer = {
--             connections = {
--               {
--                 driver = "postgresql",
--                 --dataSourceName = "postgresql://user:password@localhost:5432/dbname",
-- --                -- dataSourceName = "postgresql://zac:zac@localhost:5432/nonprod",
--                 dataSourceName = "postgresql://dba:zac@localhost:5432/prod",
--               },
-- --              -- {
-- --              --   driver = "mysql",
-- --              --   -- dataSourceName = "mysql://user:password@localhost:3306/dbname",
-- --              --   dataSourceName = "mysql://dba:zac@localhost:3306/dbname",
-- --              -- },
--             },
--           },
--         },
--       })
	

      -- Markdown LSP
      vim.lsp.config.marksman = {}

      -- XML LSP
      vim.lsp.config.lemminx = {}

      --
      -- once LSP servers are configured turn them on
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

        -- disable builtin LSP formatting 
        -- Conform plugin handles all LSP formatting
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end
        end,})
    end,
    },
 }

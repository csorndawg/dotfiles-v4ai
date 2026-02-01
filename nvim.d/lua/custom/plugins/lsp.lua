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
          "bashls",	-- bash
          "clangd",	-- c/c++
          "html",
          "jsonls",
          "lua_ls",	-- lua
          "powershell_es",	-- powershell
          "pyright",	-- python types only
	  --"ruff",	-- everything else besides python types
          "sqlls",	-- SQL
          "taplo",	-- TOML
          "yamlls",
          "vimls",	-- vimscript
	--"awk_ls",
	--"copilot",
	--"diagnosticls",		-- diagnostics integrates w/ linters
	--"docker_compose_language_service",
	--"docker_language_service",
	--"dockerls",
	--"jinja_lsp",		-- 
	--"jqls",		-- JQ
	--"just",		-- just
	--"lsp_ai",		-- 
	--"marksman",		-- markdown
	--"postgres_lsp",		-- 
	--"",		-- 
        },
      })

      ----------------------------------------------------------------
      -- LSP CONFIGURATION
      ----------------------------------------------------------------
      local lsp = vim.lsp

      ----------------------------------------------------------------
      -- PYTHON
      ----------------------------------------------------------------
      lsp.config.pyright = {}

      ----------------------------------------------------------------
      -- C / C++
      ----------------------------------------------------------------
      lsp.config.clangd = {}

      ----------------------------------------------------------------
      -- BASH
      ----------------------------------------------------------------
      lsp.config.bashls = {}

      ----------------------------------------------------------------
      -- POWERSHELL
      ----------------------------------------------------------------
      lsp.config.powershell_es = {
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
      }

      ----------------------------------------------------------------
      -- YAML
      ----------------------------------------------------------------
      lsp.config.yamlls = {
				settings = {
					yaml = {
						keyOrdering = false,
					},
				},
			}

      ----------------------------------------------------------------
      -- JSON
      ----------------------------------------------------------------
      lsp.config.jsonls = {}

      ----------------------------------------------------------------
      -- TOML
      ----------------------------------------------------------------
      lsp.config.taplo = {}

      ----------------------------------------------------------------
      -- LUA (Neovim)
      ----------------------------------------------------------------
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

      ----------------------------------------------------------------
      -- VIMSCRIPT
      ----------------------------------------------------------------
			lsp.config.vimls = {}

      ----------------------------------------------------------------
      -- SQL (Postgres + MySQL)
      ----------------------------------------------------------------
			lsp.config.sqlls = {}
			
--      lspconfig.sqlls.setup({
--        settings = {
--          sqlLanguageServer = {
--            connections = {
--              {
--                driver = "postgresql",
--                --dataSourceName = "postgresql://user:password@localhost:5432/dbname",
--                -- dataSourceName = "postgresql://zac:zac@localhost:5432/nonprod",
--                dataSourceName = "postgresql://dba:zac@localhost:5432/prod",
--              },
--              -- {
--              --   driver = "mysql",
--              --   -- dataSourceName = "mysql://user:password@localhost:3306/dbname",
--              --   dataSourceName = "mysql://dba:zac@localhost:3306/dbname",
--              -- },
--            },
--          },
--        },
--      })

      ----------------------------------------------------------------
      -- ENABLE LSP SERVERS
      ----------------------------------------------------------------
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
			})
    end,
  },
}

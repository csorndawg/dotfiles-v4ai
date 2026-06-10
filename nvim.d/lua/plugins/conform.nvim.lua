return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        -- We do NOT format on save yet
        format_on_save = false,

        -- Formatter mappings
        formatters_by_ft = {
          -- bash
          sh = { "shfmt" },
          -- c/c++
          c = { "clang_format" },
          cpp = { "clang_format" },

          -- JSON/YAML
          json = { "prettier" },
          yaml = { "yamlfmt" },

          -- lua 
          lua = { "stylua" },

          -- powershell
          ps1 = { "powershell" },

          -- python
          python = { "ruff_format" },

          -- sql
          sql = { "sqlfluff" },
          mysql = { "sqlfluff" },
          pgsql = { "sqlfluff" },

          -- TOML
          toml = { "taplo" },

          -- markdown
          markdown = {"prettier"},

          -- xml
          xml = {"xmllint"},

          -- vim
          -- vim = {"vint"},
        },

        -- Conform will notify you when a formatter errors
        notify_on_error = true,
        -- Conform will notify you when no formatters are available for the buffer
        notify_no_formatters = true,

        formatters = {
          sqlfluff = {
            require_cwd = false,  -- Don't require root directory
            args = { "format", "--dialect=postgres", "-" },
          },
        },
        -- additional configuration for specific formatters
        -- formatters = {
        --   sqlfmt = {
        --     timeout_ms = 500,   -- increase latency to avoid formatting timeouts
        --     stdin = false,
        --   },
        -- },
      })

      -- Manual format keymap (improved version that handles visual mode)
      vim.keymap.set("", "<leader>af", function()
        require("conform").format({ async = true }, function(err)
          if not err then
            local mode = vim.api.nvim_get_mode().mode
            if vim.startswith(string.lower(mode), "v") then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            end
          end
        end)
      end, { desc = "Format code" })

      -- add alternate mapping on new "[L]sp" key
      vim.keymap.set("", "<leader>lf", function()
        require("conform").format({ async = true }, function(err)
          if not err then
            local mode = vim.api.nvim_get_mode().mode
            if vim.startswith(string.lower(mode), "v") then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            end
          end
        end)
      end, { desc = "Format code" })
    end,
  },
}

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
        -- yaml = { "yamlfmt" },
        yaml = { "prettier" },

        -- lua 
        lua = { "stylua" },

        -- powershell
        ps1 = { "powershell" },

        -- python
        python = { "ruff_format" },

        -- sql
        sql = { "sqlfmt" },
        mysql = { "sqlfmt" },
        pgsql = { "sqlfmt" },

        -- TOML
        toml = { "taplo" },

        -- markdown
        markdown = {"prettier"},

        -- xml
        xml = {"xmllint"},

        -- vim
        vim = {"prettier"},
      },

      -- format_on_save = {
      --   -- I recommend these options. See :help conform.format for details.
      --   lsp_format = "fallback",
      --   timeout_ms = 500,
      -- },
      -- -- If this is set, Conform will run the formatter asynchronously after save.
      -- -- It will pass the table to conform.format().
      -- -- This can also be a function that returns the table.
      -- format_after_save = {
      --   lsp_format = "fallback",
      -- },

        -- Conform will notify you when a formatter errors
        notify_on_error = true,
        -- Conform will notify you when no formatters are available for the buffer
        notify_no_formatters = true,
      --
      -- additional configuration for specific formatters
      formatters = {
        sqlfmt = {
          timeout_ms = 500,   -- increase latency to avoid formatting timeouts
        },
      },
    -- })

-- Manual format keymap
  --   vim.keymap.set(
  --     "n",
  --     "<leader>f",
  --     function()
  --       require("conform").format({ lsp_fallback = false })
  --     end,
  --     { desc = "Format buffer" }
  --   )
  -- end,
  },
  {
    -- improved above formatter autocmd
    -- autocmd will leave visual mode when formatter called on block on visually selected code
    vim.keymap.set("", "<leader>f", function()
      require("conform").format({ async = true }, function(err)
        if not err then
          local mode = vim.api.nvim_get_mode().mode
          if vim.startswith(string.lower(mode), "v") then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
          end
        end
      end)
    end, { desc = "Format code" })
  })
  },
}

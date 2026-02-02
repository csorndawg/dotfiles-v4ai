return {
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
        yaml = { "prettier" },

        -- lua 
        lua = { "stylua" },

        -- powershell
        ps1 = { "powershell" },

        -- python
        python = { "ruff_format" },

        -- sql
        sql = { "sqlfmt" },

        -- TOML
        toml = { "taplo" },
      },
    })

    -- Manual format keymap
    vim.keymap.set(
      "n",
      "<leader>f",
      function()
        require("conform").format({ lsp_fallback = false })
      end,
      { desc = "Format buffer" }
    )
  end,
}


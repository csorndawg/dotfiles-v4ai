-- LazyVim LuaSnip copypasta
-- lua/plugins/luasnip.lua

return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local ls = require("luasnip")
      local types = require("luasnip.util.types")

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        ext_opts = {
          [types.choiceNode] = {
            active = { virt_text = { { "●", "DiagnosticWarn" } } },
          },
          [types.insertNode] = {
            active = { virt_text = { { "│", "Comment" } } },
          },
        },
        enable_autosnippets = true,
      })

      -- source friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- custom luasnips snippets
      require("luasnip.loaders.from_lua").load({
        paths = { vim.fn.stdpath("config") .. "/snippets" },
      })

      -- hot-reload on save
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = vim.fn.stdpath("config") .. "/snippets/*.lua",
        callback = function()
          require("luasnip.loaders.from_lua").load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
          })
          vim.notify("LuaSnip: snippets reloaded", vim.log.levels.INFO)
        end,
      })
    end,
  },
}

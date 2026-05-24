-- LazyVim LuaSnip copypasta

-- lua/plugins/luasnip.lua
return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp", -- optional: enables regex-based transformations
    dependencies = {
      -- friendly-snippets is optional; gives you a big pre-made snippet library.
      -- Delete if you want a fully hand-rolled setup.
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")
      local types = require("luasnip.util.types")

      -- ensure friendly-snippets snippets are sourced and available
      require("luasnip.loaders.from_vscode").lazy_load()

      -- ── Core options ────────────────────────────────────────────────────
      ls.config.set_config({
        -- Keep the last snippet active so you can jump back into it
        history = true,
        -- Update dynamic snippets as you type
        updateevents = "TextChanged,TextChangedI",
        -- Highlight active nodes
        ext_opts = {
          [types.choiceNode] = {
            active = { virt_text = { { "●", "GruvboxOrange" } } },
          },
          [types.insertNode] = {
            active = { virt_text = { { "│", "Comment" } } },
          },
        },
        enable_autosnippets = true,
      })

      -- ── Keymaps ─────────────────────────────────────────────────────────
      -- Expand or jump forward
      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
            "n",
            false
          )
        end
      end, { silent = true, desc = "LuaSnip expand/jump forward" })

      -- Jump backward
      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true, desc = "LuaSnip jump backward" })

      -- Cycle through choice nodes
      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true, desc = "LuaSnip next choice" })

      vim.keymap.set({ "i", "s" }, "<C-h>", function()
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end, { silent = true, desc = "LuaSnip prev choice" })

      -- ── Loaders ─────────────────────────────────────────────────────────
      -- Load friendly-snippets (VS Code style JSON) if you kept the dep
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Load YOUR Lua snippets from nvim/snippets/
      -- Each file must return a table: { filetype = { snip, snip, ... } }
      require("luasnip.loaders.from_lua").load({
        paths = { vim.fn.stdpath("config") .. "/snippets" },
      })

      -- Hot-reload snippet files on save (great during authoring)
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = vim.fn.stdpath("config") .. "/snippets/*.lua",
        callback = function()
          require("luasnip.loaders.from_lua").load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
          })
          vim.notify("LuaSnip: snippets reloaded", vim.log.levels.INFO)
        end,
        desc = "Hot-reload LuaSnip snippet files",
      })
    end,
  },

  -- nvim-cmp integration (if you use cmp)
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "saadparwaiz1/cmp_luasnip" },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }

      -- Add luasnip source
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "luasnip" })

      -- Tab-based cmp + luasnip coexistence
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}

local cmp = require 'cmp'
local luasnip = require 'luasnip'

vim.o.completeopt = 'menuone,noselect'

cmp.setup {

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert {
    -- Scroll documentation
    ['<A-Up>'] = cmp.mapping.scroll_docs(-4),
    ['<A-Down>'] = cmp.mapping.scroll_docs(4),

    -- Trigger completion
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Abort completion
    ['<C-e>'] = cmp.mapping.abort(),

    -- accept current selection and remain in INSERT mode
    ['<CR>'] = cmp.mapping.confirm { select = true },

    -- use "<Ctrl-,>" to accept current selection and switch to NORMAL mode
    --['<Leader><CR>'] = cmp.mapping(function(fallback)
    ['<C-,>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        -- accepts selection (defaults to the 1st item if no explicit selection made)
        cmp.confirm { select = true }

        -- use schedule to ensure text is inserted before switching to Normal mode
        vim.schedule(function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
        end)
      else
        fallback() -- Just behaves like Leader + Enter if menu is closed
      end
    end, { 'i', 's' }),

    -- Navigate completion menu
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- Jump forward in snippet
    ['<C-f>'] = cmp.mapping(function()
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      end
    end, { 'i', 's' }),

    -- Jump backward in snippet
    ['<C-b>'] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
}

-- Cmdline search cmp
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),

  sources = {
    { name = 'buffer' },
  },
})

-- Cmdline commands cmp
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
    { name = 'buffer' },    -- use buffer sources as final cmp source
  }),
})

-- Dadbod Cmp: Generic SQL
cmp.setup.filetype('sql', {
  sources = {
    { name = 'vim-dadbod-completion' },
    { name = 'buffer' },
  },
})

-- Dadbod Cmp: Postgres/MySQL filetype
cmp.setup.filetype({ 'pgsql', 'mysql' }, {
  sources = {
    { name = 'vim-dadbod-completion' },
    { name = 'buffer' },
  },
})

-- -- DAP Cmp: DAP debugger buffer(???)
-- cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
-- 	sources = {
-- 		{ name = "dap" },
-- 	},
-- })
--
--

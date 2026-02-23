local cmp = require('cmp')
local luasnip = require('luasnip')

vim.o.completeopt = "menuone,noselect"

cmp.setup({

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  
  mapping = cmp.mapping.preset.insert({
    -- Scroll documentation
    ['<A-Up>'] = cmp.mapping.scroll_docs(-4),
    ['<A-Down>'] = cmp.mapping.scroll_docs(4),
    
    -- Trigger completion
    ['<C-Space>'] = cmp.mapping.complete(),
    
    -- Abort completion
    ['<C-e>'] = cmp.mapping.abort(),
    
    -- Confirm selection
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    
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
  }),
  
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- Cmdline completions for search
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),

  sources = {
    { name = 'buffer' },
  },
})

-- Cmdline completions for commands
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

return {
  {
    --'echasnovski/mini.bracketed',
    'nvim-mini/mini.bracketed',
    version = false, -- or specify a version
    config = function()
      require('mini.bracketed').setup({
        -- Map [N, [n, ]n, ]N for conflict marker like in 'tpope/vim-unimpaired'
        conflict = { suffix = 'n' },
        -- Make diagnostic advance only by errors
        diagnostic = { options = { severity = vim.diagnostic.severity.ERROR } },
        -- Disable creation of mappings for `indent` target (for example,
        -- in favor of ones from |mini.indentscope|)
        -- indent = { suffix = '' },
        -- Disable mappings for `window` target in favor of custom ones
        window = { suffix = '' },

        -- Disable oldfile, undo, file, and treesitter targets
        oldfile = { suffix = '' },
        undo = { suffix = '' },
        file = { suffix = '' },
        treesitter = { suffix = '' },
      })
      
      -- Create custom `window` mappings
      local map = vim.keymap.set
      map('n', '<Leader>wH', "<Cmd>lua MiniBracketed.window('first')<CR>")
      map('n', '<Leader>wh', "<Cmd>lua MiniBracketed.window('backward')<CR>")
      map('n', '<Leader>wl', "<Cmd>lua MiniBracketed.window('forward')<CR>")
      map('n', '<Leader>wL', "<Cmd>lua MiniBracketed.window('last')<CR>")
    end,
  },
}

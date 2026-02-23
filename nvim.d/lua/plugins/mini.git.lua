return {
    --'echasnovski/mini.bracketed',
    'nvim-mini/mini.nvim',
    name = 'mini.git',
    config = function()
      require('mini.git').setup({})
      
      -- Create custom `window` mappings
      -- local map = vim.keymap.set
      -- map('n', '<Leader>wH', "<Cmd>lua MiniBracketed.window('first')<CR>")
      -- map('n', '<Leader>wh', "<Cmd>lua MiniBracketed.window('backward')<CR>")
      -- map('n', '<Leader>wl', "<Cmd>lua MiniBracketed.window('forward')<CR>")
      -- map('n', '<Leader>wL', "<Cmd>lua MiniBracketed.window('last')<CR>")
   end,
}

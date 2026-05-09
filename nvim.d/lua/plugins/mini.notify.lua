return {
  'nvim-mini/mini.nvim',
  name = 'mini.notify',
  config = function()
    require('mini.notify').setup {}

    -- Create custom `window` mappings
    local map = vim.keymap.set
    map('n', '<Leader>mh', '<Cmd>lua MiniNotify.show_history()<CR>')
    map('n', '<Leader>zh', '<Cmd>lua MiniNotify.show_history()<CR>')
    -- map('n', '<Leader>wh', "<Cmd>lua MiniBracketed.window('backward')<CR>")
    -- map('n', '<Leader>wl', "<Cmd>lua MiniBracketed.window('forward')<CR>")
    -- map('n', '<Leader>wL', "<Cmd>lua MiniBracketed.window('last')<CR>")
  end,
}

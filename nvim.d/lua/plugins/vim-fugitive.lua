return {
  {
    'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-repeat',
    },
    cmd = {
      'G',
      'Git',
      'Gvdiffsplit',
      'Gread',
      'Gwrite',
      'Ggrep',
      'GMove',
      'GDelete',
      'GBrowse',
      'GRemove',
      'GRename',
      'Glgrep',
      'Gedit',
    },
    ft = { 'fugitive' },
    event = 'VeryLazy',
    keys = {
      { '<leader>gw', '<cmd>Gwrite<cr>', desc = 'Gwrite', noremap = true },
      { '<leader>gL', '<cmd>Gllog<cr>', desc = 'Git log', noremap = true },
      { '<leader>gk', '<cmd>Git commit<cr>', desc = 'Git commit', noremap = true },
      { '<leader>gg', '<cmd>G<cr>', desc = 'Fugitive status', noremap = true },
      { '<leader>gv', '<cmd>Gvdiffsplit!<cr>', desc = '3-way diff split', noremap = true },
      { '<leader>gD', '<cmd>Gvdiffsplit!<cr>', desc = '3-way diff split', noremap = true },
      { '<leader>gz', '<cmd>Git<cr>', desc = 'Git status', noremap = true },
    },
  },
}

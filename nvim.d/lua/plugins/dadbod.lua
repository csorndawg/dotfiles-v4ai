return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    keys = {
      -- { 'n', '<Leader>D', '<cmd>DBUIToggle<Cr>', { desc = 'DBUI Toggle' } },
      -- { '<Leader>Dt', '<cmd>DBUIToggle<Cr>', { desc = 'DBUI Toggle' } },
      { '<Leader>Dt', '<cmd>DBUIToggle<Cr>', desc = 'DBUI Toggle' },
      { '<Leader>aD', '<cmd>DBUIToggle<Cr>', desc = 'DBUI toggle' },
      { '<Leader>aD', '<cmd>DBUIToggle<Cr>', desc = 'DBUI toggle' },
      { '<Leader>aq', '<cmd>DBUIClose<Cr>', desc = 'DBUI close' },

    },
    init = function()
      -- Your DBUI configuration
      local data_path = vim.fn.stdpath 'data'
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_save_location = data_path .. '/dadbod'
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_tmp_query_location = data_path .. '/dadbod/tmp'
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_use_nvim_notify = true
      vim.g.db_ui_execute_on_save = true
    end,
  },
}

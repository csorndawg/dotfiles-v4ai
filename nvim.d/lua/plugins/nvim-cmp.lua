return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'L3MON4D3/LuaSnip', -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet completions
      'hrsh7th/cmp-nvim-lua', -- Neovim Lua API completions
      'hrsh7th/cmp-buffer', -- Buffer completions
      'hrsh7th/cmp-path', -- Path completions
      'hrsh7th/cmp-cmdline', -- Cmdline completions
      -- 'rcarriga/cmp-dap',      -- DAP completeion   (@TODO: install core DAP plugin)
      'lukas-reineke/cmp-under-comparator', -- CMP sorting util
      'kristijanhusak/vim-dadbod-completion', -- already used below, make it explicit
      -- 'ej-shafran/cmp-sql', -- generic SQL (no DB connection needed) -- optional, see note
    },
  },
}

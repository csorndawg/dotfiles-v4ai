return {
  {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
      'L3MON4D3/LuaSnip',         -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet completions
      'hrsh7th/cmp-buffer',       -- Buffer completions
      'hrsh7th/cmp-path',         -- Path completions
      'hrsh7th/cmp-cmdline',      -- Cmdline completions
      "lukas-reineke/cmp-under-comparator",   -- CMP sorting util
    },
  }
}

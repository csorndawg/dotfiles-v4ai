-- plugins/aerial.lua
return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>aa", "<cmd>AerialToggle!<cr>", desc = "Aerial toggle" },
  },
  opts = {

    -- Highlight the symbol under the cursor in the source buffer
    highlight_on_hover = true,

    -- Highlight the symbol after jumping. Value is the duration in ms;
    -- false disables it entirely
    highlight_on_jump = 400,

    -- Filetypes to ignore
    ignore = {
      filetypes = { "txt", "bk", "ignored" },
    },
  },
}


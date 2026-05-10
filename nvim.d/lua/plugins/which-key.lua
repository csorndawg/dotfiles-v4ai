return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>g", group = "[g]it" },
        { "<leader>t", group = "[t]elescope builtins" },
        { "<leader>T", group = "[T]elescope extras" },
        { "<leader>d", group = "[d]ebug" },
        { "<leader>O", group = "[O]bsidian" },
        { "<leader>a", group = "Code [a]ctions" },
        -- { "<leader>l", group = "[L]int" },
        { "<leader>z", group = "[z]ac" },
        { "<leader>zz", group = "[zz]ac overflow" },
        { "<leader>?", group = "WhichKey Maps" },
      },
    },
    keys = {
      {
        "<leader>?g",
        function()
          require("which-key").show({ global = true })
        end,
        desc = "View Global Keymaps",
      },
      {
        "<leader>?b",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "View Local Buffer Keymaps",
      },
      {"<leader>w?", "<cmd>WhichKey <CR>", desc = "View all whichkey keymaps" },
      {"<leader>??", "<cmd>WhichKey <CR>", desc = "View all whichkey keymaps" },
    },
  }
}

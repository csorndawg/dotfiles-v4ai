return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>g", group = "[G]it" },
        { "<leader>t", group = "[T]elescope" },
        { "<leader>d", group = "[d]ebug" },
        { "<leader>o", group = "[O]bsidian" },
        { "<leader>k", group = "Code Actions" },
        -- { "<leader>l", group = "[L]int" },
        { "<leader>x", group = "E[X]tras" },
        { "<leader>z", group = "[z]ac Adhoc" },
        { "<leader>zz", group = "[z]ac Adhoc Overflow" },
        { "<leader>Z", group = "[Z]ac Experimental" },
        { "<leader>ZZ", group = "[Z]ac Experimental Overflow" },
        { "<leader>?", group = "WhichKey Maps" },
      },
    },
    keys = {
      {
        "<leader>?g",
        function()
          require("which-key").show({ global = true })
        end,
        desc = "Global WhichKey Keymaps",
      },
      {
        "<leader>?b",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Local Buffer Keymaps",
      },
      {"<leader>w?", "<cmd>WhichKey <CR>", desc = "view all whichkey keymaps" },
      {"<leader>??", "<cmd>WhichKey <CR>", desc = "View all whichkey keymaps" },
    },
  }
}

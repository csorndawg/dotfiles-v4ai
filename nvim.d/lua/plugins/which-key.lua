return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>g", group = "[G]it" },
        { "<leader>d", group = "[d]ebug" },
        { "<leader>o", group = "[O]bsidian" },
        -- { "<leader>c", group = "[C]ode" },
        { "<leader>l", group = "[L]int" },
        { "<leader>z", group = "[Z]ac" },
        { "<leader>zz", group = "[Z]ac Overflow" },
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
      {"n", "<leader>wK", "<cmd>WhichKey <CR>", desc = "view all whichkey keymaps" },
      {"n", "<leader>?w", "<cmd>WhichKey <CR>", desc = "View all whichkey keymaps" },
    },
  }
}

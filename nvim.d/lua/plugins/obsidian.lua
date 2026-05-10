-- Nvim Obsidian plugin

-- the "require" path is the path from "init.lua" reference NOT this file
local obsidian_helper = require("plugins.extras.obsidian-extras")

return {
	"epwalsh/obsidian.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy", -- Ensures the plugin loads properly
	opts = obsidian_helper.opts, -- Load custom options from helper module
	config = function(_, opts)
		require("obsidian").setup(opts) -- Ensure settings are applied
		obsidian_helper.setup() -- Set keymaps
	end,
}

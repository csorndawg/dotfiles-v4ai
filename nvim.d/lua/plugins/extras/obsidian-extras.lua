local M = {}

M.opts = {
	workspaces = {
		{
			name = "notes",
			path = "~/git/obsiddy",
		},
	},

 -- nvim-cmp completes Obisidian wiki links, local markdown links, and tags
	completion = {
		nvim_cmp = true,    -- set to false to disable "cmp"
    min_chars = 3,
	},
	notes_subdir = "_Notes",
	daily_notes = {
		folder = "Daily",
		date_format = "%Y-%m-%d",
		default_tags = {"nvim","autogen", "test-tag", "daily" },
		--template = nil,
	},
	new_notes_location = "notes_subdir",
}

-- fix for obsidian conceallevel error
vim.opt_local.conceallevel = 2

-- Function to set up keymaps after plugin loads
function M.setup()
	if not require("lazy.core.config").plugins["obsidian.nvim"]._.loaded then
		return
	end
	vim.keymap.set(
		"n",
		"<leader>On",
		"<cmd>ObsidianNew<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian new note" }
	)
	vim.keymap.set(
		"n",
		"<leader>Os",
		"<cmd>ObsidianSearch<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian [S]earch" }
	)
	vim.keymap.set(
		"n",
		"<leader>Or",
		"<cmd>ObsidianRename<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian Rename" }
	)
	vim.keymap.set(
		"n",
		"<leader>Ot",
		"<cmd>ObsidianTags<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian tag search" }
	)
end

return M

-- Obsidian Plugin Keymaps 

local map = vim.keymap.set

map("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "New note", noremap = true })

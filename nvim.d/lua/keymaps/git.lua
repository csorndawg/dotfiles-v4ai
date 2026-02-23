-- Git Plugins Keymaps
-- 

local map = vim.keymap.set

-- Fugitive keymaps
map("n", "<leader>gg", "<cmd>G<cr>", { desc = "Git status (fugitive)", noremap = true })
map("n", "<leader>gb", "<cmd>G blame<cr>", { desc = "Git blame", noremap = true })

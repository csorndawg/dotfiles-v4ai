-- Nvim Custom Keymaps
--

-- from TEEJ
vim.keymap.set("n","<space><space>x","<cmd>source %<CR>")	-- "<CR>" simulates <ENTER>
vim.keymap.set("n","<space><space>l",":.lua<CR>")
vim.keymap.set("v","<space><space>l",":lua<CR>")

-- my own remaps
-- starting out with simple remap for saving/exiting nvim
vim.keymap.set("n","<space><space>w",":w<Cr>")
vim.keymap.set("n","<space><space>q",":q<Cr>")
vim.keymap.set("n","<space><space>wq",":wq<Cr>")
vim.keymap.set("n","<space><space>wqq",":w!<Cr>:q!<Cr>")
vim.keymap.set("n","<space><space>qa",":qa<Cr>")
vim.keymap.set("n","<space><space>qaa",":qa!<Cr>")


-- ##########################################
-- EXPERIMENTAL
-- ##########################################

-- Experimental mode cycling keymaps

-- Toggle between normal and insert mode with <Leader>,,
vim.keymap.set("n", "<Leader>,,", "i", { desc = "Normal to insert mode" })
vim.keymap.set("i", "<Leader>,,", "<Esc>", { desc = "Insert to normal mode" })

-- Toggle between normal and command mode with <Leader>;;
vim.keymap.set("n", "<Leader>;;", ":", { desc = "Normal to command mode" })
vim.keymap.set("c", "<Leader>;;", "<C-c>", { desc = "Command to normal mode" })

-- Alternative ESC with <Leader><Leader>cc
vim.keymap.set("i", "<Leader><Leader><Leader>c", "<Esc>", { desc = "Alternative escape" })
vim.keymap.set("v", "<Leader><Leader><Leader>c", "<Esc>", { desc = "Alternative escape (visual)" })
vim.keymap.set("c", "<Leader><Leader><Leader>c", "<C-c>", { desc = "Alternative escape (command)" })

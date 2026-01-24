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

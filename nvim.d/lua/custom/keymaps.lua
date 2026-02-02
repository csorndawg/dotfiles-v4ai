-- Nvim Custom Keymaps
--
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
--vim.keymap.set("n", "jk", "i", { desc = "Normal to insert mode" })
--vim.keymap.set("n", "<Leader>,,", "i", { desc = "Normal to insert mode" })
--vim.keymap.set("i", "<Leader>,,", "<Esc>", { desc = "Insert to normal mode" })
--vim.keymap.set("i", "jj", "<C-c>", { desc = "Insert to normal mode" })
--vim.keymap.set("i", "kk", "<C-c>", { desc = "Insert to normal mode" })
--vim.keymap.set("i", "jk", "<C-c>", { desc = "Insert to normal mode" })

-- Toggle between normal and command mode with <Leader>;;
--vim.keymap.set("n", "<Leader>;;", ":", { desc = "Normal to command mode" })
--vim.keymap.set("c", "<Leader>;;", "<C-c>", { desc = "Command to normal mode" })

-- Alternative <ESC> Mapping 2: <C-m>
--vim.keymap.set("i", "<C-m>", "<C-c>", { desc = "Alternative escape" })
--vim.keymap.set("v", "<C-m>", "<Esc>", { desc = "Alternative escape (visual)" })
--vim.keymap.set("c", "<C-m>", "<C-c>", { desc = "Alternative escape (command)" })

-- Alternative <ESC> Mapping 3: <leader>//
--vim.keymap.set("i", "<Leader>//", "<Esc>", { desc = "Alternative escape" })
--vim.keymap.set("v", "<Leader>//", "<Esc>", { desc = "Alternative escape (visual)" })
--vim.keymap.set("c", "<Leader>//", "<C-c>", { desc = "Alternative escape (command)" })


-- swap ";" with ":"
vim.keymap.set({ "n", "v" }, ";", ":", { desc = "Enter command mode" })
vim.keymap.set({ "n", "v" }, ":", ";", { desc = "Repeat last f, t, F, or T" })

-- buffer keymaps

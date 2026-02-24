-- Core Nvim Keymaps
--

-- from TEEJ
vim.keymap.set("n","<space><space>x","<cmd>source %<CR>")	-- "<CR>" simulates <ENTER>
vim.keymap.set("n","<space><space>l",":.lua<CR>")
vim.keymap.set("v","<space><space>l",":lua<CR>")

-- 
-- MY REMAPS
--

-- save buffer with <Ctrl-s> or <Leader-s>
vim.keymap.set("n","<space>s",":w<Cr>")
vim.keymap.set("n","<space>s!",":w<Cr>")
vim.keymap.set("n","<C-s>",":w<Cr>")
vim.keymap.set("n","<A-s>",":w<Cr>")


vim.keymap.set("n","<space>q",":w<Cr>")
vim.keymap.set("n","<space>qq",":w<Cr>")
vim.keymap.set("n","<C-q>",":q<Cr>")
-- <Ctrl-Shift-Q> to forcefully quit
vim.keymap.set("n","<C-S-Q>",":q!<Cr>")

-- ##########################################
-- EXPERIMENTAL
-- ##########################################

-- Experimental mode cycling keymaps

-- Toggle between normal and insert mode with <Leader>,,
-- vim.keymap.set("n", "jk", "i", { desc = "Normal to insert mode" })
-- vim.keymap.set("n", "kj", "i", { desc = "Normal to insert mode" })
-- vim.keymap.set("n", "<Leader>,,", "i", { desc = "Normal to insert mode" })

-- Normal Escapes
vim.keymap.set("n", ",,", "i", { desc = "Normal to insert mode" })


-- Insert Escapes
vim.keymap.set("i", "jj", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", "kk", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", "jk", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", "kj", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", ",,", "<Esc>", { desc = "Insert to normal mode" })

-- Visual Escapes
-- setup ",," to also escape visual mode 
vim.keymap.set("v", ",,", "<Esc>", { desc = "Alternative escape (visual)" })

-- Cmd Escapes
vim.keymap.set("n", ";;", ":", { desc = "Normal to command mode" })
vim.keymap.set("c", ";;", "<C-c>", { desc = "Command to normal mode" })

-- Alternative <ESC> Mapping: <Leader>/
vim.keymap.set("i", "<Leader>/", "<Esc>", { desc = "Alternative escape" })
vim.keymap.set("v", "<Leader>/", "<Esc>", { desc = "Alternative escape (visual)" })

-- Alternative <ESC> Mapping 3: <leader>//
--vim.keymap.set("i", "<Leader>//", "<Esc>", { desc = "Alternative escape" })
--vim.keymap.set("v", "<Leader>//", "<Esc>", { desc = "Alternative escape (visual)" })
--vim.keymap.set("c", "<Leader>//", "<C-c>", { desc = "Alternative escape (command)" })


-- swap ";" with ":"
vim.keymap.set({ "n", "v" }, ";", ":", { desc = "Enter command mode" })
vim.keymap.set({ "n", "v" }, ":", ";", { desc = "Repeat last f, t, F, or T" })

-- buffer keymaps
-- <TBD>

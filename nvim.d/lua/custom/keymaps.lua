--------------------------------------------------
-- Core Nvim Remaps
--------------------------------------------------


-- --------------------------------
-- Essentials
-- --------------------------------

-- quit/save buffer
vim.keymap.set("n","<leader>w",":w<Cr>")
vim.keymap.set("n","<leader>q",":q<Cr>")
vim.keymap.set("n","<A-w>",":w<Cr>")
vim.keymap.set("n","<A-q>",":q<Cr>")

-- save + quit buffer
vim.keymap.set("n","<leader>wq",":wq<Cr>")
-- vim.keymap.set("n","<leader>wqf",":wq!<Cr>")

-- forcefully quit/save
vim.keymap.set("n","<space>wf",":w!<Cr>")
vim.keymap.set("n","<space>qf",":q!<Cr>")
vim.keymap.set("n","<A-w><A-f>",":w!<Cr>")
vim.keymap.set("n","<A-q><A-f>",":q!<Cr>")


-- switch b/w Normal and Insert mode with ",,"
vim.keymap.set("n", ",,", "i", { desc = "Normal to insert mode" })
vim.keymap.set("i", "jk", "<C-c>", { desc = "Normal to insert mode" })
vim.keymap.set("i", "kj", "<C-c>", { desc = "Normal to insert mode" })

-- additional Insert to Normal mode escaping
vim.keymap.set("i", "jj", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", "kk", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", "jk", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", "kj", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", ",,", "<Esc>", { desc = "Insert to normal mode" })

-- Visual to Normal Mode Escaping
vim.keymap.set("v", ",,", "<Esc>", { desc = "Alternative escape (visual)" })

-- switch b/w Normal and Cmdline Mode with <C-;>
vim.keymap.set("n", "<C-,>", ":", { desc = "Normal to command mode" })
vim.keymap.set("n", "<C-;>", ":", { desc = "Normal to command mode" })
vim.keymap.set("c", "<C-;>", "<C-c>", { desc = "Command to normal mode" })
vim.keymap.set("c", "<C-,>", "<C-c>", { desc = "Command to normal mode" })

-- Experimental mode cycling keymaps
-- <Left>/<Right> arrow keys cycle through search pattern matches
-- vim.keymap.set("n", "<Right>", "nzzzv", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Left>",  "Nzzzv", { noremap = true, silent = true })

-- exit terminal mode w/ <Esc><Esc>
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--tmux like window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

 -- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
vim.keymap.set("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })


-- buffer navi/management remaps
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<leader>bb", "<cmd>buffer #<CR>", { desc = "Last buffer", silent = true })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer", silent = true })
vim.keymap.set("n", "<leader>bD", "<cmd>bdelete!<CR>", { desc = "Force delete buffer", silent = true })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Delete other buffers", silent = true })
vim.keymap.set("n", "<leader>bl", "<cmd>ls<CR>", { desc = "List buffers", silent = true })


-- Insert Mode Movements

-- Tried using <Ctrl-Shift> keymaps but those keymaps caused breaks/errors. 
-- Issue seems to be caused by Alacritty.  Switching to <Alt> key instead.

-- jump start/end line 
vim.keymap.set("i", "<A-0>", "<ESC>^i", { desc = "move beginning of line" })
vim.keymap.set("i", "<A-4>", "<End>", { desc = "move end of line" })
-- left/right/up/down movements
vim.keymap.set("i", "<A-h>", "<Left>", { desc = "move left" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "move right" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "move down" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "move up" })


--
-- Better yank/paste with system clipboard 
--

-- yank visual selection to system clipboard
vim.keymap.set('v', '<C-y>', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader><leader>y', '"+y', { desc = 'Yank to system clipboard' })
-- paste from system clipboard in Normal and Visual modes
vim.keymap.set({'n', 'v'}, '<C-p>', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader><leader>p', '"+p', { desc = 'Paste from system clipboard' })


--
-- Vim Galore Rips:  https://github.com/mhinz/vim-galore#tips-1
--

-- saner n/N pattern match cycling
vim.keymap.set({ "n", "x", "o" }, "n", function()
  return vim.v.searchforward == 1 and "n" or "N"
end, { expr = true, silent = true })

vim.keymap.set({ "n", "x", "o" }, "N", function()
  return vim.v.searchforward == 1 and "N" or "n"
end, { expr = true, silent = true })

-- smarter command-line wildmenu navigation w/ <C-n>/<C-p>
vim.keymap.set("c", "<C-n>", function()
  return vim.fn.wildmenumode() == 1 and "<C-n>" or "<Down>"
end, { expr = true })

vim.keymap.set("c", "<C-p>", function()
  return vim.fn.wildmenumode() == 1 and "<C-p>" or "<Up>"
end, { expr = true })


-- add blank line above/below current line
vim.keymap.set("n", "[<Space>", function()
  vim.cmd("put! =repeat(nr2char(10), v:count1)")
end, { silent = true })

vim.keymap.set("n", "]<Space>", function()
  vim.cmd("put =repeat(nr2char(10), v:count1)")
end, { silent = true })

-- keep visual selection when indenting
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

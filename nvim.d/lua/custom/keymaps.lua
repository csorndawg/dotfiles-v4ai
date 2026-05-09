--------------------------------------------------
-- Core Nvim Remaps
--------------------------------------------------


-- --------------------------------
-- Essentials
-- --------------------------------

-- alt. <Esc> method with <Leader> across all modes 
-- vim.keymap.set("n","<80><fc>^H,>", "zzi", {desc="Insert mode switcher"})
-- vim.keymap.set("i","<80><fc>^H,>", "zti", {desc="Insert mode switcher"})


vim.keymap.set( "n", ",m", "zti", {desc="Move cursor to top, enter Insert",silent=true})
vim.keymap.set( "n", "m,", "zti", {silent=true})
vim.keymap.set( "n", ",,", "zzi", {silent=true})
vim.keymap.set({ "n", "i", "v", "x", "s", "o", "c" }, "<leader>,,", "<Esc>")
vim.keymap.set('t', '<Leader>,,', '<C-\\><C-n>', { desc = 'Switch from editing to normal in Terminal mode' })
vim.keymap.set('t', '<C-x><C-x>', '<C-\\><C-n>:exit<Cr>', { desc = 'Exit Terminal mode' })

-- easier way to start terminal mode
vim.keymap.set({"n","c","o"},"<C-\\>","<Esc><Cmd>vertical terminal<Cr>",{desc="Launch vert term"})
vim.keymap.set({"n","c","o"},"<Leader>vt","<Esc><Cmd>vertical terminal<Cr>",{desc="Launch vert term"})


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
-- vim.keymap.set("n", ",,", "i", { desc = "Normal to insert mode" })
vim.keymap.set("i", "jk", "<C-c>", { desc = "Normal to insert mode" })
vim.keymap.set("i", "kj", "<C-c>", { desc = "Normal to insert mode" })

-- additional Insert to Normal mode escaping
vim.keymap.set("i", "jj", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", "kk", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", "jk", "<C-c>", { desc = "Insert to normal mode" })
vim.keymap.set("i", "kj", "<C-c>", { desc = "Insert to normal mode" })

vim.keymap.set("i", ",,", "<Esc>", { desc = "Insert to normal mode" })

-- Visual to Normal Mode Escaping
-- vim.keymap.set("v", ",,", "<Esc>", { desc = "Alternative escape (visual)" })

-- switch b/w Normal and Cmdline Mode with <C-;>
vim.keymap.set("n", ";;", ":", { desc = "Normal to command mode" })
vim.keymap.set("n", "<Leader-.>", ":", { desc = "Normal to command mode" })
vim.keymap.set("c", ";;", "<Esc>", { desc = "Command to normal mode" })
vim.keymap.set("c", "<C-;>", "<C-c>", { desc = "Command to normal mode" })

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

-- smarter cmdline wildmenu navigation 
--   cycle up/down syggestions with <C-n>/<C-p>
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

-- @TODO: Need to test before uncommenting
-- -- --------------------------------------------
-- -- Lunar Vim Copypasta
-- -- --------------------------------------------
-- local lunar_opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }
-- local keymap = vim.api.nvim_set_keymap
--
--
-- -- Normal --
-- -- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", lunar_opts)
-- keymap("n", "<C-j>", "<C-w>j", lunar_opts)
-- keymap("n", "<C-k>", "<C-w>k", lunar_opts)
-- keymap("n", "<C-l>", "<C-w>l", lunar_opts)
--
-- -- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", lunar_opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", lunar_opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", lunar_opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", lunar_opts)
--
-- -- Naviagate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", lunar_opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", lunar_opts)
--
-- -- Move text up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", {desc = "Move selection down 1", remap=false})
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", {desc = "Move selection up 1", remap=false})
--
-- -- Insert --
-- -- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", lunar_opts)
--
--
-- -- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", lunar_opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", lunar_opts)
--
-- -- Visual Block --
-- -- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", lunar_opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", lunar_opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", lunar_opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", lunar_opts)
--
-- -- Terminal --
-- -- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--


-- Emacs-like navi keybinds in cmdline
-- @NOTE: Keyboard sends non-standard sequence for <ALT> (i.e. <Alt> == <80><fc>^H) 
--        To work around this I am using the raw escape characters in the keymaps
--        Use ":echo getcharstr()" + <key>  to get raw char sequence, if needed.

-- jump to start of line w/ <Alt-a>
vim.keymap.set("c", "<A-a>", "<Home>", { desc= 'Cmd cursor to SOL', silent=false})
vim.keymap.set("c", "<80><fc>^Ha", "<Home>")

-- jump to start of line w/ <Alt-e>
vim.keymap.set("c", "<A-e>", "<End>", { desc= 'Cmd cursor to EOL', silent=false})
vim.keymap.set("c", "<80><fc>^He", "<End>", { desc= 'Cmd cursor to EOL', silent=false})


-- left/right char movement <Alt-,> + <Alt-.>
vim.keymap.set("c", "<A-,>", "<Left>", { desc= 'Cmd cursor left', silent=false})
vim.keymap.set("c", "<A-.>", "<Right>", { desc= 'Cmd cursor right', silent=false})
vim.keymap.set("c", "<80><fc>^H,", "<Left>", { desc= 'Cmd cursor left', silent=false})
vim.keymap.set("c", "<80><fc>^H.", "<Right>", { desc= 'Cmd cursor left', silent=false})

-- Jump to next/back words <Alt-S-,> + <Alt-S-.>
vim.keymap.set("c", "<A-<>", "<S-Left>", { desc= 'Cmd cursor SOW', silent=false})
vim.keymap.set("c", "<A->>", "<S-Right>", { desc= 'Cmd cursor SOW', silent=false})
vim.keymap.set("c", "<80><fc>^H<", "<S-Left>", { desc= 'Cmd cursor left', silent=false})
vim.keymap.set("c", "<80><fc>^H>", "<S-Right>", { desc= 'Cmd cursor left', silent=false})

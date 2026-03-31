-- Nvim settings taken/bookmarked from external sources to experiment with in the future


------------------------------------------------------------------------
-- Chad Settings
------------------------------------------------------------------------
local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
-- g.loaded_node_provider = 0
-- g.loaded_python3_provider = 0
-- g.loaded_perl_provider = 0
-- g.loaded_ruby_provider = 0



------------------------------------------------------------------------
-- Lazy Settings
------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Sync with system clipboard
-- opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldtext = ""
-- opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
-- opt.list = true -- Show some invisible characters (tabs...

opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 4 -- Lines of context

-- @NOTE: unsure what this does so commenting out for now
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
-- opt.statuscolumn = [[%!v:lua.LazyVim.statuscolumn()]]
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000

-- UNDO > SWAP 
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")
opt.updatetime = 200 -- Save swap file and trigger CursorHold

-- wildmode
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wildmode = "list:full" -- Command-line completion mode
-- wildignore not guaranteed to be respected by FZF/Telescope by default
-- instead dedicated ignore files (e.g. .gitignore trumphs wildignore)
vim.opt.wildignore:append({
  "*/.tmp/*",
  "*/tmp/*",
  "*.ark",
  "*/.ignored/*",
  "*/ignored/*",
  "*.ignored",
  "*.zip",
  "*.tmp",
})
opt.wildignore = 
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
-- vim.g.markdown_recommended_style = 0




------------------------------------------------------------------------
-- Astro Settings
------------------------------------------------------------------------




------------------------------------------------------------------------
-- Misc. Settings
------------------------------------------------------------------------



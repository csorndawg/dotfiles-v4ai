-- Nvim Custom Options/Settings
-- Nvim Custom Options/Settings
--

vim.opt.number = true		-- turn line numbers on
vim.opt.relativenumber = true	-- turn relative line numbers on
vim.opt.incsearch = true	-- turn on incremental search

-- Lazyvim Options Copypasta
local opt = vim.opt


opt.completeopt = "menuone,noselect,noinsert,popup"	-- completion menu options
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldtext = ""
-- opt.formatexpr = "v:lua.LazyVim.format.formatexpr()"
-- opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = false -- Show some invisible characters (tabs...
-- opt.mouse = "a" -- enable mouse for [a]ll modes
opt.mouse = "" -- enable mouse for [a]ll modes
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 4 -- Lines of context

-- @TODO: Review/Customize below Lazyvim options
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
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
opt.timeout = on        -- tells nvim to wait max <timeoutlen> time for a mapped key sequence
opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap          

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Sync clipboard between OS and Neovim.
-- Sync clipboard between OS and Neovim.

--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.o.clipboard = 'unnamedplus'
-- end)

-- WSL clipboard error fix 
-- Detect WSL
local is_wsl = vim.fn.has("wsl") == 1
if is_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
--
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Sync with system clipboard

-- disabling swap files
-- enabling undodir
opt.swapfile = false
opt.undofile = true

local undodir = vim.fn.expand('~/.local/state/undo')

if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir,"p")
end
opt.undodir = undodir


--
-- newdots copypasta
--

vim.opt.hlsearch = false

-- better CMD wildmenu/mode completion
-- :set wildmode=list:longest,full
vim.opt.wildmode = { "list:longest", "full" }

-- do not show below file types in wildmenu
vim.opt.wildignore = "*.o,*.obj,*.dll,*.exe,*.pyc,*.swp,*node_modules/**,*venv**,*.gig,*.IgnoreMe**,*.patch"

-- function for toggling case sensitivity searching w/ ripgrep as vimgrep search engine
local function set_rg_grepprg(case_sensitive)
	local base_cmd = "rg --vimgrep --no-heading --color=never"
	if case_sensitive == false then
		vim.opt_local.grepprg = base_cmd .. " -i" -- Add -i for case-insensitive
	else
		vim.opt_local.grepprg = base_cmd -- Default is case-sensitive
	end
end

-- case-insensitive:
-- set_rg_grepprg(false)

-- case-sensitive:
-- case-sensitive:
set_rg_grepprg(true)
set_rg_grepprg(true)


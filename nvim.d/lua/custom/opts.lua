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
opt.laststatus = 5 -- global statusline
opt.list = false -- Show some invisible characters (tabs...

opt.mouse = "" -- disable mouse across [a]ll modes    (set to "a" to enable)
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 8 -- Lines of context

-- @TODO: Review/Customize below Lazyvim options
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
-- opt.statuscolumn = [[%!v:lua.LazyVim.statuscolumn()]]

-- -- tabs/indents -- --
vim.opt.tabstop = 2         -- num spaces tabs counts for
vim.opt.softtabstop = 2     -- num spaces tab counts for
opt.smartindent = true -- Insert indents automatically
opt.linebreak = true -- Wrap lines at convenient points

opt.termguicolors = true -- True color support
opt.timeout = on        -- tells nvim to wait max <timeoutlen> time for a mapped key sequence
opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
opt.updatetime = 300      -- CursorHold update frequency
opt.undofile = true
opt.undolevels = 10000
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap          


vim.g.markdown_recommended_style = 0    -- fix markdown indentation settings

-- clipboard issue fix
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- sync nvim clipboard with system clipboard

-- disabling swap files
-- enabling undodir
opt.swapfile = false
opt.undofile = true
local undodir = vim.fn.expand('~/.local/state/undo')

if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir,"p")
end
opt.undodir = undodir


-- disable highlighting by default (use keymap to toggle state)
vim.opt.hlsearch = false

-- better CMD wildmenu/mode completion
vim.opt.wildmode = { "list:longest", "full" }

-- wildmenu ignored file types
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

-- case-sensitivea ripgrep:
-- set_rg_grepprg(true)
set_rg_grepprg(true)

-- Smart clipboard provider: WSL, SSH (OSC52), or native
local function setup_clipboard()
  -- WSL: use win32yank
  if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
      name = 'win32yank-wsl',
      copy  = { ['+'] = 'win32yank.exe -i --crlf', ['*'] = 'win32yank.exe -i --crlf' },
      paste = { ['+'] = 'win32yank.exe -o --lf',   ['*'] = 'win32yank.exe -o --lf'   },
      cache_enabled = 0,
    }
  end
  -- else: not WSL, not SSH → let Neovim auto-detect (xclip/pbcopy/etc.)
end
setup_clipboard()
vim.opt.clipboard = 'unnamedplus'

---------------------------------------------
-- Opt-Related Keymaps
---------------------------------------------
vim.keymap.set('n', '<leader>zzh', function()
  vim.opt.hlsearch = not vim.opt.hlsearch:get()
end, { desc = 'Toggle hlsearch' })

-- disable mouse 
vim.opt.mouse = ""

---------------------------------------------
-- Astro Settings - Prelim
---------------------------------------------
vim.opt.breakindent = true -- wrap indent to match  line start
vim.opt.iskeyword:append("-") -- consider string-string as whole word
vim.opt.colorcolumn="81"

-- toggle colorcolumn keymap w/ guards
vim.keymap.set('n', '<leader>zr', function()
  -- get current colorcolumn value
  local cc = vim.opt_local.colorcolumn:get()

  if #cc > 0 then
    -- if set, clear
    vim.opt_local.colorcolumn = ""
    print("Colorcolumn disabled")
  else
    -- if empty, set to preferred char indx
    vim.opt_local.colorcolumn = "80"
    print("Colorcolumn enabled at charindx 80")
  end
end, { desc = "Toggle colorcolumn" })


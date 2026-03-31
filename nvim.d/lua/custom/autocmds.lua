-----------------------------------------------
-- Custom Nvim Autocmds
-----------------------------------------------

--
-- Highlight yanked text
--
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('zc-highlight-yank', {clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- autocmd to turn highlighting on/off for incremental search matches
-- copied directly from docs, need to check if this is valid code before uncommenting
--augroup vimrc-incsearch-highlight
--  autocmd!
--  autocmd CmdlineEnter [\/\?] :set hlsearch
--  autocmd CmdlineLeave [\/\?] :set nohlsearch
--augroup END
--

--
-- Disable new line auto-commenting
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})


--
-- Smarter cursorline: only current window + not in insert mode
--
local cursorline_group = vim.api.nvim_create_augroup("SmartCursorline", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  group = cursorline_group,
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  group = cursorline_group,
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

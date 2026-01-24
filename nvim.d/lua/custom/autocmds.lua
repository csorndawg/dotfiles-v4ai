-- Nvim Custom Autocmds
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

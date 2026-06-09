-----------------------------------------------
-- Custom Nvim Autocmds
-----------------------------------------------

local function augroup(name)
  return vim.api.nvim_create_augroup("zc_" .. name, { clear = true })
end

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

-- make Nvim treat ".rc" as ".bash"
vim.filetype.add({
  extension = {
    rc = "bash",
  },
})


--- resize splits automatically if window gets resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- 
-- go to last location when reopening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].zc_last_loc then
      return
    end
    vim.b[buf].zc_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- auto create missing dir path components when saving a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

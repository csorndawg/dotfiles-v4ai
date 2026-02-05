-- Module for Lazy Plugins Keymaps


-- open Lazy UI
vim.keymap.set("n", "<leader>L", ":Lazy<CR>", { desc = "Open Lazy" })

-- mini.files open
vim.keymap.set("n", "<leader>-", function()
  local minifiles = require('mini.files')
  minifiles.open()
end,
{desc = "Open file explorer", noremap = true, silent = false})

-- mini.files close
vim.keymap.set("n", "<C-q><C-q>", function()
  local minifiles = require('mini.files')
  minifiles.close()
end,
{desc = "Close file explorer", noremap = true, silent = false})

-- @NOTE: from mini.files doc
-- Yank in register full path of entry under cursor
local yank_path = function()
  local MiniFiles = require('mini.files')
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then return vim.notify('Cursor is not on valid entry') end
  vim.fn.setreg(vim.v.register, path)
end

-- maps <leader>gy to function output we created above
vim.keymap.set("n", "<leader>gy", yank_path, {desc = "Yank path", noremap = true, silent = false})


-- mini.notify show history
vim.keymap.set("n", "<leader>gh", function()
  local notif = require('mini.notify')
  notif.show_history()
end,
{desc = "View notify history", noremap = true, silent = false})

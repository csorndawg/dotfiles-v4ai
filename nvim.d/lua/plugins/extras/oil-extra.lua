-- oil.nvim extra configuration

local oil = require("oil")

-- open oil buffer in floating window
vim.keymap.set("n", "-", "<Cmd>Oil --float<CR>", { desc = "Oil CWD" })

-- adding a few additional keymaps for OIL API
-- vim.keymap.set(
--  "n", "<Leader>tt", 
-- "<Cmd>lua require('oil.actions').open_terminal.callback()<CR>",
-- { desc = "Open terminal from Oil",noremap=true}
-- )
--

-- define Winbar helper function — 
-- we need to define it here so _G is populated before oil buffers open
function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
  local dir = oil.get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    return vim.api.nvim_buf_get_name(bufnr)
  end
end

-- create user command for Cmdline tab completion
vim.api.nvim_create_user_command("GetOilWinbar", function()
    print(_G.get_oil_winbar())
end, { desc = "Print the current Oil directory" })

-- enable additional keymap for newly created function
vim.keymap.set("n", "<leader>od", "<Cmd>GetOilWinbar<CR>", { desc = "Show CWD" })
vim.keymap.set("n", "<leader>zd", "<Cmd>GetOilWinbar<CR>", { desc = "Show CWD" })

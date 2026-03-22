local oil = require("oil")

-- 1. Set up your existing keymap
vim.keymap.set("n", "-", "<Cmd>Oil --float<CR>", { desc = "Oil CWD" })

-- 2. Define the Winbar Function
-- We keep it in _G so the winbar string "%!v:lua.get_oil_winbar()" can find it
function _G.get_oil_winbar()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
    local dir = oil.get_current_dir(bufnr)
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        return vim.api.nvim_buf_get_name(bufnr)
    end
end

-- 3. setup Oil with the winbar
oil.setup({
    win_options = {
        winbar = "%!v:lua.get_oil_winbar()",
    },
})

-- 4. Create a User Command for Cmdline completion
-- enables Cmdline tab/autocompletion 
vim.api.nvim_create_user_command("GetOilWinbar", function()
    print(_G.get_oil_winbar())
end, { desc = "Print the current Oil directory" })

-- enable additional keymap for newly created function
vim.keymap.set("n", "<leader>xd", "<Cmd>GetOilWinbar<CR>", { desc = "Show Oil directory" })

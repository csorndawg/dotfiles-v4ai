-- Nvim Plugin Remaps
-- File is a mix of experimental config, config to add/vet later, disabled config, 
-- and adhoc mappings that aren't big enough to warrant their own file.



-- Nvim.Comment Remaps
-- local comment = require(nvim.comment)
-- vim.keymap.set({"n","v"}, "<leader>/", "gcc", { desc = "toggle comment", remap = true })
-- vim.keymap.set("v", "<leader>/", "gc"--[[  ]], { desc = "toggle comment", remap = true })

-- make comment above and drop in insert mode
-- vim.keymap.set('n', 'gcO', function()
--   api.insert.linewise.above()
-- end)

vim.keymap.set('n', 'gcO','kgco', {desc="Add comment to line above, remains in Insert mode"})

-- same as above, just with another keymap to trigger
vim.keymap.set('n', '<Leader>/k', function()
  api.insert.linewise.above()
end)

-- toggle selection (linewise)
vim.keymap.set('x', '<leader>/', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
end)

-- Toggle selection (blockwise)
vim.keymap.set('x', '<leader>zzb', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.blockwise(vim.fn.visualmode())
end)



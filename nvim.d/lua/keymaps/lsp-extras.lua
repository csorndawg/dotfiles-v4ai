--
-- LSP "Astro" Keymaps
-- 

local map = vim.keymap.set

-- builtin LSP Keymaps

map({"n","x"},"<Leader>la",
function()
vim.lsp.buf.code_action() end,
{desc="LSP code action", noremap=true}
)

map("n","<Leader>ld",
function()
  vim.lsp.buf.definition()
end,
{desc = "LSP definition",noremap=true}
)

map("n","<Leader>lD",
function()
  vim.lsp.buf.declaration()
end,
{desc = "LSP declaration",noremap=true}
)

map("n","<Leader>lr",
function()
  vim.lsp.buf.references()
end,
{desc = "Search LSP refs",noremap=true}
)

map("n","<Leader>lR",
function()
  vim.lsp.buf.rename()
end,
{desc = "Rename current symbol",noremap=true}
)

map("n","<Leader>lS",
function()
  vim.lsp.buf.signature_help()
end,
{desc = "LSP sig help",noremap=true}
)

map("n","<Leader>ls",
function()
  vim.lsp.buf.workspace_symbol()
end,
{desc = "Search workplace symbols",noremap=true}
)

map("n","<Leader>lt",
function()
  vim.lsp.buf.type_definition()
end,
{desc = "Define current type",noremap=true}
)

map("n","<Leader>lw",
function()
  vim.lsp.buf.list_workspace_folders()
end,
{desc = "List workplace folders",noremap=true}
)

map("n","<Leader>lZ",
function()
  vim.lsp.buf.document_symbol()
end,
{desc = "List buffer symbols",noremap=true}
)

-- -- add hover (definition + docstring) with customized hover window
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   vim.lsp.handlers.hover, {
--     -- Use "single", "double", "rounded", "solid", or "shadow"
--     border = "rounded",
--     -- Optional: set maximum width and height
--     max_width = 80,
--     max_height = 30,
--   }
-- )
-- map("n",
-- "<Leader>lh",
-- function()
--   vim.lsp.buf.hover()
-- end,
-- {desc = "Toggle hover win", noremap= true}
-- )

-- customized hover window 
vim.keymap.set('n', '<Leader>lh', function()
  vim.lsp.buf.hover { border = "single", max_height = 15, max_width = 60 }
  vim.cmd("normal! zz")     -- center screen after toggling hover window
end, { desc = "Hover documentation" })

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover { border = "single", max_height = 20, max_width = 100 }
  vim.cmd("normal! zz")     -- center screen after toggling hover window
end, { desc = "Hover documentation" })

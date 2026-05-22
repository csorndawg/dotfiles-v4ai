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

map("n","<Leader>lh",
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

-- code folding plugin

return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			-- Fold settings
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			-- Keymaps
			vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "UFO Fold Open" })
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "UFO Fold Close" })

			-- Setup UFO
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
}

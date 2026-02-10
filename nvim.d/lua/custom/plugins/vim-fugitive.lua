return {
	{
		"tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-repeat",
    },
		cmd = {
			"G",
			"Git",
			"Gvdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
		event = "VeryLazy",
	},
}

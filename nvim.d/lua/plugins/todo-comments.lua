-- Highlight todo, notes, etc in comments
return {
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
      -- return extended default configutation from extras file
      return require('plugins.extras.todo-comments-extra')
    end,
	},
}
-- vim: ts=2 sts=2 sw=2 et

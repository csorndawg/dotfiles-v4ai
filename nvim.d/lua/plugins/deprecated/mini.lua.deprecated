-- mini.nvim plugin spec

-- MUST wrap your plugin spec inside a "return" table
--
-- essentially the plugin spec is saved as a Lua table 
-- and this file "returns" that table, making it available
-- to lazy.lua when it imports this file
return {
	-- plugin spec table here
	{
		"https://github.com/nvim-mini/mini.nvim",	-- just as before github URL comes first
		config = function()
			local statusline = require 'mini.statusline'
			statusline.setup { use_icons = true }
		end
	}
}

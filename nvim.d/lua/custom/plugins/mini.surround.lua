-- Mini.surround plugin configuration
-- Location: ~/.config/nvim/lua/plugins/mini-surround.lua

return {
  {
    "echasnovski/mini.surround",
    
    -- When to load this plugin
    -- Option 1: Load immediately
    -- lazy = false,
    
    -- Option 2: Load when entering insert/visual mode (recommended)
    event = { "BufReadPost", "BufNewFile" },
    
    -- Option 3: Load on first use of the keymaps
    -- keys = {
    --   { "sa", mode = { "n", "v" }, desc = "Add surrounding" },
    --   { "sd", mode = "n", desc = "Delete surrounding" },
    --   { "sr", mode = "n", desc = "Replace surrounding" },
    -- },
    
    -- Your custom configuration
    -- ONLY include settings you want to CHANGE from defaults
    opts = {
      -- Change highlight duration from default 500ms to 700ms
      highlight_duration = 700,
      
      -- That's it! All other settings will use their defaults:
      -- - custom_surroundings = nil
      -- - mappings will be the default (sa, sd, sf, etc.)
      -- - n_lines = 20
      -- - respect_selection_type = false
      -- - search_method = 'cover'
      -- - silent = false
    },
    
    -- Optional: if you need to do additional setup after the plugin loads
    -- config = function(_, opts)
    --   require("mini.surround").setup(opts)
    --   
    --   -- Add any additional customization here
    --   -- For example, additional keymaps or autocommands
    -- end,
  },
}

-- EXPLANATION:
-- When you use 'opts', Lazy automatically calls:
--   require("mini.surround").setup(opts)
-- 
-- The setup() function merges your opts with the plugin's defaults:
--   - You specified: highlight_duration = 700
--   - Plugin defaults: everything else
--   - Result: All defaults + your highlight_duration override
--
-- You do NOT need to copy all the default values!

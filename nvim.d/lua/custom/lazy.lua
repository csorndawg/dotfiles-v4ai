-- this file bootstraps lazy.nvim

print("\n")
print("This file is getting required by our INIT file")
print("Following TEEJs steps from his video")
print("\n")

-- ========================================================================
-- LAZY BOOTSTRAP
-- ========================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- tells neovim to prepend lazypath to neovims runtime path
vim.opt.rtp:prepend(lazypath)

-- moved to "init.lua" and defined before "requiring" this file
-- make sure `mapleader` and `maplocalleader` set before
-- loading lazy.nvim to ensure mappings work as intended
--vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({

  -- defines nvim plugins to install and setup configuration
  spec = {

    -- add nord colorscheme
    {
	    "https://github.com/shaunsingh/nord.nvim",	-- plugin github url 
	    config = function() vim.cmd.colorscheme "nord" end	-- set config parameter to a function that sets "vim.cmd.colorscheme" to "nord" 
    },
    -- mini.lua
    --{
	    --"https://github.com/nvim-mini/mini.nvim",
	    --config = function()
		    --local statusline = require 'mini.statusline'
		    --statusline.setup {use_icons = true}
	    --end
    --},

    -- lua paths are defined RELATIVE to my "nvim.d/init.lua"
    -- imports all plugin specs definied in "lua/custom/plugins/" folder 
    { import = "plugins" },
  },
})

  -- @TODO: uncomment after testing TEEEJ code
  --defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    --lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    --version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
    --},
  --install = { colorscheme = { "tokyonight", "habamax" } },
  --install = { colorscheme = { "nord.nvim", "habamax" } },
  --checker = {
    --enabled = true, -- check for plugin updates periodically
    --notify = false, -- notify on update
  --}, -- automatically check for plugin updates
  --performance = {
    --rtp = {
      -- disable some rtp plugins
      --disabled_plugins = {
        --"gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        --"tarPlugin",
        --"tohtml",
        --"tutor",
        --"zipPlugin",
      --},
    --},
  --},
--})




-- ========================================================================
-- POST-BOOTSTRAP CUSTOM CONFIGURATION
-- ========================================================================




--[[
      NVIM CONFIG v2
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
--vim.g.maplocalleader = '\\'

-- Set to true if you have a Nerd Font installed and selected in the terminal
--vim.g.have_nerd_font = false
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- require 'options'

-- [[ Basic Keymaps ]]
-- require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
-- require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
-- require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
--vim: ts=2 sts=2 sw=2 et


-- ==========================================================================================
-- ME && TEEEEEEEJs CUSTOM CONFIG STUFF && SNIPPETS
-- ==========================================================================================

-- imports "custom/lazy.lua" file which bootstraps lazy.nvim
require 'custom.lazy'

-- import custom options/settings
require 'custom.opts'

-- import custom core (non-plugin) keymaps
require 'custom.keymaps'

-- import custom autocmds
require 'custom.autocmds'

-- import custom <x>
-- require 'custom.x'


-- @TODO:
-- 	This might need to be changed if scope of overrides changes and it 
-- 	becomes an overrides "folder" instead of an override "file".
--
-- 	Also this should always be the LAST module imported to prevent any
-- 	of the overrides.lua configuration from being overwritten.
--
-- import custom overrides
-- require 'custom.overrides'


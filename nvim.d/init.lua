--[[
      NVIM CONFIG v2
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

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
-- MY CUSTOM CONFIG
--   -- lua/custom:	all core nvim related config files (e.g. settings)
--   -- lua/plugins:  	all plugin related config files	(e.g. setup file for UFO plugin)
-- ==========================================================================================

-- @TODO: move to a settings/opts file
vim.g.python3_host_prog = vim.fn.expand '~/dotfiles/config.d/venvs/venv-nvimd/bin/python'

-- imports "custom/lazy.lua" file which bootstraps lazy.nvim
require 'custom.lazy'

-- import custom options/settings
require 'custom.opts'

-- import custom core (non-plugin) keymaps
require 'custom.keymaps'

-- import custom autocmds
require 'custom.autocmds'

-- source all EXTRA/EXTENDED PLUGIN custom config files
-- these files are ALWAYS sourced AFTER their respective plugin install/setup file
local extras_dir = vim.fn.stdpath 'config' .. '/lua/plugins/extras'
for _, file in ipairs(vim.fn.readdir(extras_dir)) do
  -- non ".lua" files will be ignored
  if file:sub(-4) == '.lua' then
    local extra_module = 'plugins.extras.' .. file:sub(1, -5)
    -- print('Extra module:  ',extra_module)

    local ok, mod = pcall(require, extra_module)
    if not ok then
      print('Error occurred while loading:  ', mod, '.lua')
      -- else
      -- print('Successfully loaded:  ', extra_module .. ".lua")
    end
  end
end

-- @TODO: Refactor into 'lua/keymaps'
-- import custom plugin keymaps
require 'utils.lazy-keymaps'
require 'keymaps'

-- import custom <x>
-- require 'custom.x'

-- import custom overrides
-- require 'custom.overrides'

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
-- ==========================================================================================


-- @TODO: move to a settings/opts file
vim.g.python3_host_prog = vim.fn.expand("~/dotfiles/config.d/venvs/venv-nvimd/bin/python")

-- imports "custom/lazy.lua" file which bootstraps lazy.nvim
require 'custom.lazy'

-- import custom options/settings
require 'custom.opts'

-- import custom core (non-plugin) keymaps
require 'custom.keymaps'


-- import custom autocmds
require 'custom.autocmds'

-- import custom plugin keymaps
require 'custom.lazy-keymaps'

-- import custom <x>
-- require 'custom.x'

-- import custom overrides
-- require 'custom.overrides'

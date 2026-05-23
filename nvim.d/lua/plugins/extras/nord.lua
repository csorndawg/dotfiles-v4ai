-- Nord.nvim colorscheme configuration 
-- Current default colorscheme

return {
  "shaunsingh/nord.nvim",
  lazy = false, -- setting this to "false" makes nord 'default' theme 
  priority = 1000,
  config = function()
    -- nord configuration variables 
    vim.g.nord_contrast = false
    vim.g.nord_borders = true
    vim.g.nord_disable_background = false
    vim.g.nord_italic = true
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = true

    -- load nord colorscheme as default colorscheme
    vim.cmd.colorscheme("nord")
  end,
}

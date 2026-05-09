-- plugins/oil.lua
return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    lazy = false,
    dependencies = { 'refractalize/oil-git-status.nvim' },
    opts = {
      float = {
        border = 'rounded',
      },
      win_options = {
        signcolumn = 'yes:2',
        winbar = '%!v:lua.get_oil_winbar()',
      },
      keymaps = {
        ['<C-c>'] = false,
        ['<C-c><C-c>'] = 'actions.close',
      },
      columns = {
        'icon', -- just icon, no oil-git-status entry here
      },
    },
    config = function(_, opts)
      local oil = require 'oil'

      function _G.get_oil_winbar()
        local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local dir = oil.get_current_dir(bufnr)
        if dir then
          return vim.fn.fnamemodify(dir, ':~')
        else
          return vim.api.nvim_buf_get_name(bufnr)
        end
      end

      oil.setup(opts)
      require('oil-git-status').setup() -- load oil-git extension

      -- @NOTE: Using "<Leader><key1><key2>" for clean whichkey groupings. 
      --        Revert to "<Leader><key1" if it becomes to cumbersome.
      --
      -- keymaps that only work in oil filetypes (buffers)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'oil',
        callback = function()
          -- toggle hidden files
          vim.keymap.set('n', '<Leader>oh', function()
            oil.toggle_hidden()
          end, { buffer = true, desc = 'Oil: toggle hidden' })

          -- open entry in vert split
          vim.keymap.set('n', '<Leader>ov', function()
            oil.select { vertical = true }
          end, { buffer = true, desc = 'Oil: open vert split' })

          -- open file-previewer in vert split
          vim.keymap.set('n', '<Leader>op', function()
            oil.open_preview { vertical = true }
          end, { buffer = true, desc = 'Oil: vert preview' })

          -- open terminal in new split
          vim.keymap.set('n', '<Leader>ot', function()
            require('oil.actions').open_terminal.callback()
          end, { buffer = true, desc = 'Oil: open term' })

          -- yanks current row abs path
          vim.keymap.set('n', '<Leader>oa',
          "<Cmd>lua require('oil.actions').yank_entry.callback()<Cr>",
          { desc = 'Yank oil entry abspath', buffer = true })

          -- yank current entry filename only ([y]ank [h]ere)
          vim.keymap.set('n', '<Leader>of', '0y$', { desc = 'Oil: yank filename', buffer = true })
        end,
      })
    end,
  },
}

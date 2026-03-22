return {
  {
      'nvim-telescope/telescope.nvim',
      version = '*',
      dependencies = {
          'nvim-lua/plenary.nvim',
          -- optional but recommended
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
        print("Telescope installed")
        require('telescope').setup {
          pickers = {
            find_files = {
              -- set ivy as default theme for all find_files pickers
              theme = "ivy"
            }
          }
        }

        -- search all files in cwd 
        vim.keymap.set("n","<space>tf",require('telescope.builtin').find_files, {desc="Find files (cwd)"})

        -- search all dotfiles 
        vim.keymap.set("n","<space>tz", function() 
          require('telescope.builtin').find_files{
            cwd = vim.fn.expand('~') ..  '/dotfiles'
          }
        end,{desc = 'Search dotfiles'})

        -- search all files in neovim directory
        vim.keymap.set("n","<space>tn", function() 
          local opts = require('telescope.themes').get_dropdown({
            cwd = vim.fn.stdpath("config")
          })
          require('telescope.builtin').find_files(opts)
        end, {desc = 'Search nvim files'})

        -- search all git repos 
        vim.keymap.set("n","<space>tg", function() 
          local opts = require('telescope.themes').get_dropdown({
            cwd = vim.fn.expand('~') .. '/git'
          })
          require('telescope.builtin').find_files(opts)
        end, {desc = 'Search git repo'})

        -- search nvim help docs 
        vim.keymap.set("n","<space>th", require('telescope.builtin').help_tags, {desc = 'Search help tags'})
      end,
  }
}

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

        --
        vim.keymap.set("n","<space>tl",require('telescope.builtin').live_grep, {desc="Live grep"})

        -- 
        vim.keymap.set("n","<space>tb",require('telescope.builtin').buffers, {desc="Search buffers"})

        --
        vim.keymap.set("n","<space>to",require('telescope.builtin').oldfiles, {desc="Search oldfiles"})

        -- 
        vim.keymap.set("n","<space>tc",require('telescope.builtin').commands, {desc="Search cmdline cmds"})

        --
        vim.keymap.set("n","<space>ts",require('telescope.builtin').search_history, {desc="Search search history"})
        
        -- 
        vim.keymap.set("n","<space>tH",require('telescope.builtin').command_history, {desc="Search cmdline history"})
        
        -- 
        vim.keymap.set("n","<space>tm",require('telescope.builtin').marks, {desc="Search marks"})

        -- 
        vim.keymap.set("n","<space>tr",require('telescope.builtin').registers, {desc="Search registers"})

        -- 
        vim.keymap.set("n","<space>tk",require('telescope.builtin').keymaps, {desc="Search keymaps"})

        -- 
        vim.keymap.set("n","<space>tq",require('telescope.builtin').quickfix, {desc="Search quickfix"})

        -- 
        vim.keymap.set("n","<space>tQ",require('telescope.builtin').quickfixhistory, {desc="Search quickfix history"})

        -- 
        vim.keymap.set("n","<space>ta",require('telescope.builtin').current_buffer_fuzzy_find, {desc="Search current buffer"})

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

        -- Git Pickers
        -- 
        vim.keymap.set("n","<space>gc",require('telescope.builtin').git_commits, {desc="Search git commits"})
        -- 
        vim.keymap.set("n","<space>gS",require('telescope.builtin').git_stash, {desc="Search stashes"})
        -- 
        vim.keymap.set("n","<space>gl",require('telescope.builtin').git_branches, {desc="Search branches"})
        -- 
        vim.keymap.set("n","<space>gs",require('telescope.builtin').git_status, {desc="Git status"})
        vim.keymap.set("n","<space>gB",require('telescope.builtin').git_bcommits, {desc="Search buffer commits"})

      end,
  }
}

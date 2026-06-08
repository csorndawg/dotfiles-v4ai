return {
  'andyg/leap.nvim',
  url = 'https://codeberg.org/andyg/leap.nvim',
  dependencies = { 'tpope/vim-repeat' }, -- for dot-repeat support
  config = function()
    local leap = require('leap')

    -- ---------------------------------------------------------------------
    -- Default keymaps (equivalent to require('leap').create_default_mappings())
    -- but using `f`/`F` instead of `s`/`S`.
    -- ---------------------------------------------------------------------
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')

    -- ---------------------------------------------------------------------
    -- FAQ: "Enhanced f/t motions" (1-character search)
    -- A single-character, current-window, label-free leap that behaves like
    -- a multi-line f/t. Bound here to `t`/`T` so f/F stay 2-char leaps.
    -- ---------------------------------------------------------------------
    local function leap_1char(opts)
      opts = opts or {}
      require('leap').leap(vim.tbl_extend('keep', opts, {
        inputlen = 1,
        -- No autojump, no labels: act like a pure f/t over multiple lines.
        opts = { labels = '', safe_labels = '' },
      }))
    end

    -- forward (like an enhanced `f`)
    vim.keymap.set({ 'n', 'x', 'o' }, 't', function()
      leap_1char({ target_windows = { vim.fn.win_getid() } })
    end)
    -- backward (like an enhanced `F`)
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', function()
      leap_1char({ backward = true, target_windows = { vim.fn.win_getid() } })
    end)

    -- ---------------------------------------------------------------------
    -- Enhanced `/` and `?` searching: jump to a labeled match on CmdlineLeave.
    -- ---------------------------------------------------------------------
    vim.api.nvim_create_autocmd('CmdlineLeave', {
      group = vim.api.nvim_create_augroup('LeapOnSearch', {}),
      callback = function()
        local ev = vim.v.event
        local is_search_cmd = (ev.cmdtype == '/') or (ev.cmdtype == '?')
        -- Allow CmdLineLeave-related chores to be completed before
        -- invoking Leap.
        vim.schedule(function()
          local cnt = vim.fn.searchcount().total
          if is_search_cmd and (not ev.abort) and (cnt > 1) then
            -- We want "safe" labels, but no autojump (as the search
            -- command already does that), so just use `safe_labels`
            -- as `labels`, with n/N removed.
            local labels = require('leap').opts.safe_labels:gsub('[nN]', '')
            -- For `pattern` search, we never need to adjust conceallevel
            -- (no user input). We cannot merge `nil` from a table, but
            -- using the option's current value has the same effect.
            local vim_opts = { ['wo.conceallevel'] = vim.wo.conceallevel }
            require('leap').leap {
              pattern = vim.fn.getreg('/'), -- last search pattern
              windows = { vim.fn.win_getid() },
              opts = { safe_labels = '', labels = labels, vim_opts = vim_opts },
            }
          end
        end)
      end,
    })
  end,
}

local tterm = require 'toggleterm'

local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

tterm.setup {
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {

    border = 'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
}

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { noremap = true, desc = 'Exit Term' })
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true, desc = 'Exit Term' })
  vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-W>h]], { noremap = true, desc = 'Term Left' })
  vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-W>j]], { noremap = true, desc = 'Term Down' })
  vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-W>k]], { noremap = true, desc = 'Term Up' })
  vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-W>l]], { noremap = true, desc = 'Term Right' })
end
vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

-- running jupyter (console + lab) sessions via ToggleTerm
--
-- function _JUPYTER_CONSOLE_TOGGLE()
--     -- '99' is a randomly choosen integer
--     -- parameter repsents "<term id>" thus it needs to be unique
--     -- picking a large number like "99" should ensure its not
--     -- already in use by another toggle terminal process
--     require("toggleterm").toggle_command("jupyter console", 99)
-- end
-- vim.keymap.set("n", "<leader>zj", _JUPYTER_CONSOLE_TOGGLE, { desc = "Toggle Jupyter Console", noremap=true })
--

local jupyter_term = nil
function _JUPYTER_CONSOLE_TOGGLE()
  if jupyter_term == nil then
    jupyter_term = require('toggleterm.terminal').Terminal:new {
      cmd = 'jupyter console',
      direction = 'float',
      hidden = true,
      float_opts = {
        border = 'curved',
        width = math.floor(vim.o.columns * 0.6),
        height = math.floor(vim.o.lines * 0.6),
      },
      on_open = function(t)
        vim.fn.chansend(t.job_id, '! echo "Launched from Nvim"\n')
      end,
    }
  end
  jupyter_term:toggle()
end
vim.keymap.set('n', '<leader>zj', _JUPYTER_CONSOLE_TOGGLE, { desc = 'ToggleTerm: Jupyter Console', noremap = true })

local jupyter_lab_term = nil
function _JUPYTER_LAB_TOGGLE()
  if jupyter_lab_term == nil then
    jupyter_lab_term = require('toggleterm.terminal').Terminal:new {
      cmd = 'jupyter lab',
      direction = 'float',
      hidden = true,
      float_opts = {
        border = 'curved',
        width = math.floor(vim.o.columns * 0.6),
        height = math.floor(vim.o.lines * 0.6),
      },
      on_open = function(t)
        vim.fn.chansend(t.job_id, '\n')
        -- vim.fn.chansend(t.job_id, '! echo "Launched from Nvim"\n')
      end,
    }
  end
  jupyter_lab_term:toggle()
end
vim.keymap.set('n', '<leader>zl', _JUPYTER_LAB_TOGGLE, { desc = 'ToggleTerm: Jupyter Lab', noremap = true })

-- similar logic but extending to CHEAT command
function _CHEAT_TOGGLE()
    vim.ui.input({ prompt = "cheat: " }, function(input)
        if input == nil then return end
        
        cheat_term = require("toggleterm.terminal").Terminal:new({
            cmd = "cheat " .. input .. "; $SHELL",
            direction = "float",
            hidden = true,
            close_on_exit = false,
            float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.6),
                height = math.floor(vim.o.lines * 0.6),
            },
        })
        cheat_term:toggle()
    end)
end
vim.keymap.set('n', '<leader>zc', _CHEAT_TOGGLE, { desc = 'ToggleTerm: Cheat', noremap = true })

--
-- @TODO: Add similar "toggle" function for lazygit after installing + configuring on my machines
--
-- -- function _LAZYGIT_TOGGLE()
-- -- 	lazygit:toggle()
-- -- end

-- more examples
local trim_spaces = true

-- send single line
vim.keymap.set('v', '<space>tl', function()
  tterm.send_lines_to_terminal('single_line', trim_spaces, { args = vim.v.count })
end)

-- send entire selection block
vim.keymap.set('v', '<space>tb', function()
  tterm.send_lines_to_terminal('single_line', trim_spaces, { args = vim.v.count })
end)

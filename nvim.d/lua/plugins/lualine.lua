-- LuaLina Lazy Spec

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
  -- If you want to ensure your dedicated venv is set here, you can use `init`:
  -- init = function()
  --   vim.g.python3_host_prog = "/path/to/your/venv/bin/python"
  -- end,
  config = function()
    local lualine = require("lualine")

    -- helper: only show venv for python buffers
    local function is_python_file()
      return vim.bo.filetype == "python"
    end

    -- helper: derive venv name from g:python3_host_prog
    -- example: /home/user/.local/share/nvim/venv/bin/python -> "venv"
    local function get_venv_name()
      local pyprog = vim.g.python3_host_prog or ""
      if pyprog == "" then
        return ""
      end
      -- :p full path, :h dirname (bin), :h dirname (venv root), :t tail (venv name)
      local name = vim.fn.fnamemodify(pyprog, ":p:h:h:t")
      if name == "" then
        return ""
      end
      return string.format("(%s)", name)
    end

    local config = {
      options = {
        theme = "nord",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
        icons_enabled = true,
      },
      sections = {
        lualine_a = { { "mode" } },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          "searchcount",
          "diagnostics",
          {
            get_venv_name,
            cond = is_python_file,
            color = {
              fg = "#B48EAD",
              gui = "italic",
            },
          },
          -- "buffers",
        },
        lualine_x = { "filetype" },
        lualine_y = { "progress", "location" },
        lualine_z = { "filename","hostname"  },
      },
      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "fileformat", "encoding", "location" },
        lualine_y = { "hostname" },
      },
    }

    lualine.setup(config)
  end,
}

-- Debugger config, works for "python","bash", and "c++" 
-- but can be extended to include more in the future.

-- lua/plugins/dap.lua
return {

  -- ── Core ──────────────────────────────────────────────────────────────
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      -- UI
      { "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          local dap, dapui = require("dap"), require("dapui")
          dapui.setup()
          -- auto-open/close UI on session events
          dap.listeners.after.event_initialized["dapui_config"] = dapui.open
          dap.listeners.before.event_terminated["dapui_config"] = dapui.close
          dap.listeners.before.event_exited["dapui_config"]     = dapui.close
        end,
      },
      -- Inline variable values
      { "theHamsta/nvim-dap-virtual-text",
        opts = { virt_text_pos = "eol" },
      },
      -- Mason adapter installer
      { "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
          ensure_installed = { "python", "codelldb", "bash" },
          handlers = {},  -- uses default mason-nvim-dap handlers
        },
      },
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end,            desc = "Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                    desc = "Continue" },
      { "<leader>di", function() require("dap").step_into() end,                   desc = "Step into" },
      { "<leader>do", function() require("dap").step_over() end,                   desc = "Step over" },
      { "<leader>dO", function() require("dap").step_out() end,                    desc = "Step out" },
      { "<leader>dr", function() require("dap").repl.open() end,                   desc = "Open REPL" },
      { "<leader>dl", function() require("dap").run_last() end,                    desc = "Run last" },
      { "<leader>dq", function() require("dap").terminate() end,                   desc = "Terminate" },
      { "<leader>du", function() require("dapui").toggle() end,                    desc = "Toggle UI" },
    },
    config = function()
      -- sign column icons (optional but nice)
      vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition" })
      vim.fn.sign_define("DapStopped",             { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine" })
    end,
  },

  -- ── Python adapter ────────────────────────────────────────────────────
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      -- require("dap-python").setup("python")

      -- point at debugpy installed in standard/default venv python
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(vim.fn.expand("~/.config/venvs/venv-nvim/bin/python"))

      -- extra python-specific keymaps
      vim.keymap.set("n", "<leader>dm", require("dap-python").test_method, { desc = "Debug method" })
      vim.keymap.set("n", "<leader>dC", require("dap-python").test_class,  { desc = "Debug class" })
    end,
  },

  -- ── cmp-dap ───────────────────────────────────────────────────────────
  {
    "rcarriga/cmp-dap",
    dependencies = { "mfussenegger/nvim-dap", "hrsh7th/nvim-cmp" },
    config = function()
      require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = { { name = "dap" } },
      })
    end,
  },

  -- ── Treesitter parser for dap-repl (nice-to-have) ────────────────────
  -- No extra plugin needed — just ensure the parser is installed:
  -- :TSInstall dap_repl
  -- Or add to your treesitter ensure_installed list:
  -- { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "dap_repl", ... } } }

  -- ── Neotest (nice-to-have) ────────────────────────────────────────────
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    keys = {
      { "<leader>dn", function() require("neotest").run.run() end,                               desc = "Run nearest test" },
      { "<leader>dN", function() require("neotest").run.run(vim.fn.expand("%")) end,             desc = "Run file tests" },
      { "<leader>dd", function() require("neotest").run.run({ strategy = "dap" }) end,           desc = "Debug nearest test" },
      { "<leader>ds", function() require("neotest").summary.toggle() end,                        desc = "Test summary" },
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
          python = "python",  -- or a function returning venv path
        },
      },
    },
  },
}

return {
	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			
			-- Configure linters by filetype
			lint.linters_by_ft = {
				python = { "ruff", "mypy", "flake8" },
				bash = { "shellcheck" },
				yaml = {},
				docker = {},
        --toml ={"taplo"},
        toml = {"taplo"},
        cpp = {"cpplint"},
        sql = {"sqlfluff"},
			}

			-- Track the linting level (error = disabled, warning = some linting, info = full linting)
			_G.lint_level = "error" -- Default to showing only errors (disabled state)

			-- Function to update linting level
			_G.update_lint_level = function(level)
				_G.lint_level = level
				local message = "Linting level set to: " .. level:upper()
				vim.api.nvim_echo({ { message, "InfoMsg" } }, false, {})
			end

			-- Create autocommand for linting
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = lint_augroup,
				callback = function()
					-- Check filetype and lint level
					local ft = vim.bo.filetype
					local supported_filetypes = { bash = true, python = true, yaml = true, cpp = true, sql = true, docker = false, toml = true }

					-- Only run the linter in buffers that you can modify and are supported
					if supported_filetypes[ft] and vim.opt_local.modifiable:get() then
						-- Only lint if level is not "error" (disabled)
						if _G.lint_level ~= "error" then
							lint.try_lint()
						end
					end
				end,
			})

      -- Show diagnostics in floating window when cursor holds on a line
      vim.api.nvim_create_autocmd("CursorHold", {
          callback = function()
              vim.diagnostic.open_float(nil, { 
                  focusable = false,
                  close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                  border = "rounded",
                  source = "always",
                  prefix = " ",
              })
          end
      })

    -- Adjust how quickly the float appears (in milliseconds)
      vim.opt.updatetime = 500  -- 500ms delay

      --
      -- LINTER Keymaps
			vim.api.nvim_set_keymap(
				"n",
				"<leader>li",
				":lua update_lint_level('info')<CR>",
				{ noremap = true, silent = true, desc = "Lint Level: Info" }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>lw",
				":lua update_lint_level('warning')<CR>",
				{ noremap = true, silent = true, desc = "Lint Level: Warning" }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>le",
				":lua update_lint_level('error')<CR>",
				{ noremap = true, silent = true, desc = "Lint Level: Error (Disabled)" }
			)

      -- shows linters are configured for current buffer file type
      -- AND which ones are currently running
      vim.keymap.set(
        "n",
        "<leader>lv",
        function()
            local linters = require("lint").get_running()
            local configured = require("lint").linters_by_ft[vim.bo.filetype] or {}
            
            local msg = string.format(
                "Configured: [%s] | Running: [%s]",
                table.concat(configured, ", "),
                #linters > 0 and table.concat(linters, ", ") or "none"
            )
            
            vim.notify(msg, vim.log.levels.INFO)
        end,
        { noremap = true, silent = true, desc = "View active linters" }
      )

      -- forcefully shows linter diagnostics
      vim.keymap.set(
        "n",
        "<leader>ld",
        function()
            vim.diagnostic.open_float(nil, { 
                border = "rounded",
                source = "always",
            })
        end,
        { desc = "Show line diagnostics" }
    )

      -- @NOTE: DONT DELETE -- using this as reference for tweaking lazy lua plugins structure
		-- 	vim.keymap.set(
		-- 		"n",
		-- 		"<leader>lv",
		-- 		-- ":lua update_lint_level('warning')<CR>",
		-- 		function()
  --         -- 2 lines below are syntaxically equivalent (one is just syntax sugar?)
  --         -- "<cmd> require('lint').<plugin function>() <cr>"
  --         -- require('<plugin name>').<plugin function>
  --         -- example: 
  --         -- -- vim.keymap.set("n", "zR", "<cmd> require('ufo').openAllFolds() <cr>", { desc = "UFO Fold Open" })
  --         -- -- vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "UFO Fold Open" })
  --         local linters = require("lint").get_running()
  --         if #linters == 0 then
  --           return ">> "
  --         end
  --         return ">> " .. table.concat(linters,"|")
  --       end,
		-- 		{ noremap = true, silent = true, desc = "View active linters" }
		-- 	)
		end,
	},
}

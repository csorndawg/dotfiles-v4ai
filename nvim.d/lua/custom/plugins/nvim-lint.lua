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
					local supported_filetypes = { bash = true, python = true, yaml = true, docker = false, toml = true }

					-- Only run the linter in buffers that you can modify and are supported
					if supported_filetypes[ft] and vim.opt_local.modifiable:get() then
						-- Only lint if level is not "error" (disabled)
						if _G.lint_level ~= "error" then
							lint.try_lint()
						end
					end
				end,
			})

			-- Keymaps to toggle linting levels
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

			vim.api.nvim_set_keymap(
				"n",
				"<leader>lv",
				-- ":lua update_lint_level('warning')<CR>",
				function()
          -- 2 lines below are syntaxically equivalent (one is just syntax sugar?)
          -- "<cmd> require('lint').<plugin function>() <cr>"
          -- require('<plugin name>').<plugin function>
          -- example: 
          -- -- vim.keymap.set("n", "zR", "<cmd> require('ufo').openAllFolds() <cr>", { desc = "UFO Fold Open" })
          -- -- vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "UFO Fold Open" })
          local linters = require("lint").get_running()
          if #linters == 0 then
            return ">> "
          end
          return ">> " .. table.concat(linters,"|")
        end,
				{ noremap = true, silent = true, desc = "View active linters" }
			)
		end,
	},
}

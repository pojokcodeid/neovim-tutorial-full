return {
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			-- When in diff mode, we want to use the default
			-- vim text objects c & C instead of the treesitter ones.
			local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
			local configs = require("nvim-treesitter.configs")
			for name, fn in pairs(move) do
				if name:find("goto") == 1 then
					move[name] = function(q, ...)
						if vim.wo.diff then
							local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
							for key, query in pairs(config or {}) do
								if q == query and key:find("[%]%[][cC]") then
									vim.cmd("normal! " .. key)
									return
								end
							end
						end
						return fn(q, ...)
					end
				end
			end
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufRead", "VeryLazy" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		version = false,
		build = ":TSUpdate",
		lazy = true,
		cmd = {
			"TSInstall",
			"TSInstallInfo",
			"TSInstallSync",
			"TSUpdate",
			"TSUpdateSync",
			"TSUninstall",
			"TSUninstallInfo",
			"TSInstallFromGrammar",
		},
		opts = function()
			return {
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },
				incremental_selection = {
					enable = true,
				},
				autopairs = {
					enable = true,
				},
			}
		end,
		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				---@type table<string, boolean>
				local added = {}
				opts.ensure_installed = vim.tbl_filter(function(lang)
					if added[lang] then
						return false
					end
					added[lang] = true
					return true
				end, opts.ensure_installed)
			end
			require("nvim-treesitter.configs").setup(opts)
			vim.schedule(function()
				require("lazy").load({ plugins = { "nvim-treesitter-textobjects" } })
			end)
		end,
	},
}

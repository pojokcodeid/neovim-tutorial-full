return {
	{
		"pojokcodeid/auto-lsp.nvim",
		event = { "VeryLazy", "BufReadPre", "BufNewFile", "BufRead" },
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", lazy = true },
			{
				"neovim/nvim-lspconfig",
				lazy = true,
				cmd = {
					"LspInfo",
					"LspInstall",
					"LspUninstall",
				},
				-- config = function()
				-- 	require("lspconfig.ui.windows").default_options.border = "rounded"
				-- end,
			},
			{
				"williamboman/mason.nvim",
				lazy = true,
				cmd = {
					"Mason",
					"MasonInstall",
					"MasonUninstall",
					"MasonUninstallAll",
					"MasonLog",
				},
				opts = function()
					local icons = require("user.icons").ui
					return {
						ui = {
							-- border = "none",
							border = icons.Border,
							icons = {
								package_pending = icons.DotCircle,
								package_installed = icons.CheckCircle,
								package_uninstalled = icons.BlankCircle,
							},
							keymaps = {
								toggle_server_expand = "<CR>",
								install_server = "i",
								update_server = "u",
								check_server_version = "c",
								update_all_servers = "U",
								check_outdated_servers = "C",
								uninstall_server = "X",
							},
						},
						log_level = vim.log.levels.INFO,
						max_concurrent_installers = 4,
					}
				end,
				config = function(_, opts)
					require("mason").setup(opts)
				end,
			},
		},
		opts = function(_, opts)
			opts.skip_config = opts.skip_config or {}
			opts.ensure_installed = opts.ensure_installed or {}
			opts.automatic_installation = true
			vim.list_extend(opts.ensure_installed, { "lua_ls" })
			opts.format_on_save = false -- config format on save none-ls
			opts.virtual_text = false
			opts.timeout_ms = 5000
			return opts
		end,
		config = function(_, opts)
			require("auto-lsp").setup(opts)
		end,
		-- stylua: ignore
		keys = {
			{ "<leader>l", "", desc = "  LSP", mode = "n" },
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "n" },
			{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics", mode = "n" },
			{ "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics", mode = "n" },
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", mode = "n" },
			{ "<leader>lI", "<cmd>Mason<cr>", desc = "Mason", mode = "n" },
			{ "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", mode = "n" },
			{ "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", mode = "n" },
			{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "Code Lens Action", mode = "n" },
			{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", mode = "n" },
			{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", mode = "n" },
			{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", mode = "n" },
			{ "<leader>lS",	"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",	desc = "Workspace Symbols",	mode = "n"},
		},
	},
}

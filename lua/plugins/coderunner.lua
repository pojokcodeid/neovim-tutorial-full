return {
	"CRAG666/code_runner.nvim",
	event = "VeryLazy",
	cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
	opts = function(_, opts)
		opts.filetype = opts.filetype or {}
		opts.mode = "float"
		opts.focus = true
		opts.startinsert = true
		opts.term = {
			position = "bot",
			size = 50,
		}
		opts.float = {
			close_key = "<ESC>",
			border = "rounded",
			height = 0.8,
			width = 0.8,
			x = 0.5,
			y = 0.5,
			border_hl = "FloatBorder",
			float_hl = "Normal",
			blend = 0,
		}
		vim.list_extend(opts.filetype, {
			-- add run code hires
			java = {
				"cd $dir &&",
				"javac $fileName &&",
				"java $fileNameWithoutExt",
			},
		})
	end,
	config = function(_, opts)
		require("code_runner").setup(opts)
	end,
	keys = {
		{ "<leader>r", "", desc = "  Run", mode = "n" },
		{ "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code", mode = "n" },
		{ "<leader>rf", "<cmd>RunFile<CR>", desc = "Run File", mode = "n" },
		{ "<leader>rp", "<cmd>RunProject<CR>", desc = "Run Project", mode = "n" },
	},
}

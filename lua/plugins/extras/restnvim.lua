return {
	"rest-nvim/rest.nvim",
	-- NOTE: Follow https://github.com/rest-nvim/rest.nvim/issues/306
	commit = "91badd46c60df6bd9800c809056af2d80d33da4c",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		event = "VeryLazy",
	},
	config = function()
		require("rest-nvim").setup()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "http", "httpResult" },
			callback = function()
				local opt = vim.opt
				opt.number = false -- Print line number
				opt.preserveindent = false -- Preserve indent structure as much as possible
				opt.relativenumber = false
			end,
		})
	end,
	ft = "http",
	keys = {
		{
			"<Leader>rh",
			function()
				require("rest-nvim").run()
			end,
			desc = "Run http request under cursor",
		},
		{
			"<Leader>rH",
			function()
				require("rest-nvim").last()
			end,
			desc = "Run last http request",
		},
	},
}

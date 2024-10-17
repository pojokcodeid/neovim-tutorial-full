return {
	"folke/which-key.nvim",
	lazy = true,
	keys = { "<leader>", '"', "'", "`", "c", "v" },
	event = "VeryLazy",
	opts = function()
		return {
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
			},
			icons = {
				mappings = false,
			},
			win = {
				row = -1,
				border = "rounded", -- none, single, double, shadow
				padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
				title = true,
				title_pos = "center",
				zindex = 1000,
				bo = {},
				wo = {},
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			show_help = true, -- show help message on the command line when the popup is visible
			show_keys = true, -- show the currently pressed key and its label as a message in the command line
			-- Disabled by default for Telescope
			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt" },
			},
			---@type false | "classic" | "modern" | "helix"
			preset = "classic",
		}
	end,
	config = function(_, opts)
		require("which-key").setup(opts)
	end,
}

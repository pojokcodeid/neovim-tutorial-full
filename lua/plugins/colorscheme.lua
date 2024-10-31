return {
	"sharpchen/Eva-Theme.nvim",
	lazy = false,
	priority = 1000,
	build = ":EvaCompile",
	opts = {
		override_highlight = {
			dark = {
				["MiniIndentscopeSymbol"] = { fg = "#FF9070" },
				["MiniIndentscopeSymbolOff"] = { fg = "#FF9070" },
			},
		},
	},
	config = function(_, opts)
		require("Eva-Theme").setup(opts)
		local colorscheme = "Eva-Dark"
		vim.cmd("colorscheme " .. colorscheme)
	end,
}

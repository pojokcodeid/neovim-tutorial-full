return {
	"sharpchen/Eva-Theme.nvim",
	lazy = false,
	priority = 1000,
	build = ":EvaCompile",
	opts = function(_, opts)
		local dark = require("Eva-Theme.palette"):from_variant("dark")
		local light = require("Eva-Theme.palette"):from_variant("light")
		opts.override_highlight = {
			dark = {
				["MiniIndentscopeSymbol"] = { fg = "#FF9070" },
				["MiniIndentscopeSymbolOff"] = { fg = "#FF9070" },
				["WinBar"] = { bg = dark.background },
				["WinBarNC"] = { bg = dark.background },
				["StatusLine"] = { bg = dark.background },
				["StatusLineNC"] = { bg = dark.background },
			},
			dark_italic = {
				["MiniIndentscopeSymbol"] = { fg = "#FF9070" },
				["MiniIndentscopeSymbolOff"] = { fg = "#FF9070" },
				["WinBar"] = { bg = dark.background },
				["WinBarNC"] = { bg = dark.background },
				["StatusLine"] = { bg = dark.background },
				["StatusLineNC"] = { bg = dark.background },
			},
			dark_bold = {
				["MiniIndentscopeSymbol"] = { fg = "#FF9070" },
				["MiniIndentscopeSymbolOff"] = { fg = "#FF9070" },
				["WinBar"] = { bg = dark.background },
				["WinBarNC"] = { bg = dark.background },
				["StatusLine"] = { bg = dark.background },
				["StatusLineNC"] = { bg = dark.background },
			},
			light = {
				["MiniIndentscopeSymbol"] = { fg = "#FF9070" },
				["MiniIndentscopeSymbolOff"] = { fg = "#FF9070" },
				["WinBar"] = { bg = light.background },
				["WinBarNC"] = { bg = light.background },
				["StatusLine"] = { bg = light.background },
				["StatusLineNC"] = { bg = light.background },
			},
		}
		return opts
	end,
	config = function(_, opts)
		require("Eva-Theme").setup(opts)
		local colorscheme = require("pcode.user.custem").themes.evatheme or "Eva-Dark"
		vim.cmd("colorscheme " .. colorscheme)
	end,
}

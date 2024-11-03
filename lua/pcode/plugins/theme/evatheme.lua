return {
	"sharpchen/Eva-Theme.nvim",
	lazy = false,
	priority = 1000,
	-- opts = function(_, opts)
	-- 	local dark = require("Eva-Theme.palette"):from_variant("dark")
	-- 	local light = require("Eva-Theme.palette"):from_variant("light")
	-- 	opts.override_highlight = {
	-- 		dark = {
	-- 			["MiniIndentscopeSymbol"] = { fg = "#FF9070" },
	-- 			["MiniIndentscopeSymbolOff"] = { fg = "#FF9070" },
	-- 			["WinBar"] = { bg = dark.background },
	-- 			["WinBarNC"] = { bg = dark.background },
	-- 			["StatusLine"] = { bg = dark.background },
	-- 			["StatusLineNC"] = { bg = dark.background },
	-- 		},
	-- 		dark_italic = {
	-- 			["MiniIndentscopeSymbol"] = { fg = "#FF9070" },
	-- 			["MiniIndentscopeSymbolOff"] = { fg = "#FF9070" },
	-- 			["WinBar"] = { bg = dark.background },
	-- 			["WinBarNC"] = { bg = dark.background },
	-- 			["StatusLine"] = { bg = dark.background },
	-- 			["StatusLineNC"] = { bg = dark.background },
	-- 		},
	-- 		dark_bold = {
	-- 			["MiniIndentscopeSymbol"] = { fg = "#FF9070" },
	-- 			["MiniIndentscopeSymbolOff"] = { fg = "#FF9070" },
	-- 			["WinBar"] = { bg = dark.background },
	-- 			["WinBarNC"] = { bg = dark.background },
	-- 			["StatusLine"] = { bg = dark.background },
	-- 			["StatusLineNC"] = { bg = dark.background },
	-- 		},
	-- 		light = {
	-- 			["MiniIndentscopeSymbol"] = { fg = "#FF9070" },
	-- 			["MiniIndentscopeSymbolOff"] = { fg = "#FF9070" },
	-- 			["WinBar"] = { bg = light.background },
	-- 			["WinBarNC"] = { bg = light.background },
	-- 			["StatusLine"] = { bg = light.background },
	-- 			["StatusLineNC"] = { bg = light.background },
	-- 		},
	-- 	}
	-- 	return opts
	-- end,
	opts={},
	config = function(_, opts)
		require("Eva-Theme").setup(opts)
		local color = require("Eva-Theme.palette").dark
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          local hi = vim.api.nvim_set_hl
		  hi(0, "MiniIndentscopeSymbol", { fg = "#FF9070" })
		  hi(0, "MiniIndentscopeSymbolOff", { fg = "#FF9070" })
		  hi(0, "WinBar", { bg = color.background })
		  hi(0, "StatusLine", { bg = color.background })
		  hi(0, "StatusLineNC", { bg = color.background })
		end,
	    })
		local colorscheme = pcode.themes.evatheme or "Eva-Dark"
		vim.cmd("colorscheme " .. colorscheme)
	end,
}

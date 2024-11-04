return {
	"sharpchen/Eva-Theme.nvim",
	lazy = false,
	priority = 1000,
	-- opts = function(_, opts)
	-- 	local dark = require("Eva-Theme.palette").dark
	-- 	local light = require("Eva-Theme.palette").light
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
	opts = {},
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
				hi(0, "LspInfoBorder", { fg = "#8A97C3" })
				-- hi(0, "FloatBorder", { fg = "#2F3F5C" })
				-- hi(0, "FloatBorder", { fg = "#598DEF" })
				hi(0, "FloatBorder", { fg = "#8A97C3" })
				hi(0, "StatusLine", { bg = color.background })
				hi(0, "StatusLineNC", { bg = color.background })
				hi(0, "WinBar", { bg = color.background })
				hi(0, "WinBarNC", { bg = color.background })
				hi(0, "NormalFloat", { bg = color.background })
				hi(0, "NormalNC", { bg = color.background })
				hi(0, "@tag.delimiter.javascript", { fg = "#838FA7" })
				hi(0, "@tag.delimiter.tsx", { fg = "#838FA7" })
				-- git
				hi(0, "NvimTreeGitNewIcon", { bg = color.dark, fg = color.git.added })
				hi(0, "NvimTreeGitRenamedIcon", { bg = color.dark, fg = color.git.added })
				hi(0, "NvimTreeGitDeletedIcon", { bg = color.dark, fg = color.git.stagedDeleted })
				hi(0, "NvimTreeGitDirtyIcon", { bg = color.dark, fg = color.git.diffModified })
				hi(0, "NvimTreeGitIgnoredIcon", { bg = color.dark, fg = color.git.ignored })
				hi(0, "NvimTreeGitMergeIcon", { bg = color.dark, fg = color.git.diffModified })
				hi(0, "NvimTreeGitStagedIcon", { bg = color.dark, fg = color.git.stagedModified })
				hi(0, "NvimTreeWinSeparator", { bg = color.dark, fg = color.comment })
				hi(0, "MiniIndentscopeSymbol", { bg = color.dark, fg = color.parameter })
				-- cursor
				-- hi(0, "Cursor", { bg = "#838FA7", fg = "#838FA7" })
				hi(0, "CursorColumn", { bg = color.dark, fg = "#838FA7" })
				hi(0, "TermCursor", { bg = "#FF9070", fg = color.dark })
				hi(0, "TermCursorNC", { bg = "#FF9070", fg = color.dark })
			end,
		})
		local colorscheme = pcode.themes.evatheme or "Eva-Dark"
		vim.cmd("colorscheme " .. colorscheme)
	end,
}

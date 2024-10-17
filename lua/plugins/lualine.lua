local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

function M.config()
	local icons = require("user.icons")
	local mode = {
		"mode",
		padding = 1,
		separator = { left = " ", right = "" },
		right_padding = 3,
		fmt = function(str)
			return icons.ui.Neovim .. " " .. str
		end,
	}

	-- get lsp info
	local get_lspinfo = {
		function()
			return require("user.utils.lualine").lsp_info()
		end,
		icon = icons.ui.Gear,
		padding = 1,
	}

	-- get space size
	local spaces = {
		function()
			local shiftwidth = vim.fn.shiftwidth()
			return icons.ui.Tab .. " " .. shiftwidth
		end,
		padding = 1,
	}

  -- stylua: ignore
  local colors = {
    blue              = '#9ece6a',
    cyan              = '#bb9af7',
    black             = '#1a1b26',
    black_transparant = '#1a1b2600',
    white             = '#c6c6c6',
    red               = "#ff757f",
    skyblue           = '#7aa2f7',
    grey              = '#3b4261',
    yellow            = "#ffc777",
    fg_gutter         = "#3b4261",
    green1            = "#4fd6be",
  }

	local bubbles_theme = {
		normal = {
			a = { fg = colors.black, bg = colors.skyblue },
			b = { fg = colors.white, bg = colors.grey },
			c = { fg = colors.white, bg = colors.black_transparant },
		},

		insert = {
			a = { fg = colors.black, bg = colors.blue },
			b = { fg = colors.blue, bg = colors.grey },
		},
		visual = {
			a = { fg = colors.black, bg = colors.cyan },
			b = { fg = colors.cyan, bg = colors.grey },
		},
		replace = {
			a = { bg = colors.red, fg = colors.black },
			b = { bg = colors.fg_gutter, fg = colors.red },
		},
		command = {
			a = { bg = colors.yellow, fg = colors.black },
			b = { bg = colors.fg_gutter, fg = colors.yellow },
		},
		terminal = {
			a = { bg = colors.green1, fg = colors.black },
			b = { bg = colors.fg_gutter, fg = colors.green1 },
		},
		inactive = {
			a = { fg = colors.white, bg = colors.black_transparant },
			b = { fg = colors.white, bg = colors.black_transparant },
			c = { fg = colors.black, bg = colors.black_transparant },
		},
	}
	require("lualine").setup({
		options = {
			theme = bubbles_theme,
			component_separators = "",
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				"TelescopePrompt",
				"packer",
				"alpha",
				"dashboard",
				"NvimTree",
				"Outline",
				"DressingInput",
				"toggleterm",
				"lazy",
				"mason",
			},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { mode },
			lualine_b = { "branch" },
			lualine_c = { get_lspinfo, "diagnostics" },
			lualine_x = { spaces, "diff", "filetype" },
			lualine_y = { "progress" },
			lualine_z = {
				{ "location", separator = { left = "", right = " " }, left_padding = 3 },
			},
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = {},
	})
end

return M

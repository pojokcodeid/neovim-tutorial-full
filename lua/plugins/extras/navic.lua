local M = {
	"SmiteshP/nvim-navic",
	event = "VeryLazy",
	dependencies = {
		"LunarVim/breadcrumbs.nvim",
		opts = {},
		config = true,
	},
}

function M.config()
	local icons = require("user.icons").kind
	for key, value in pairs(icons) do
		icons[key] = value .. " "
	end
	require("nvim-navic").setup({
		icons = icons,
		lsp = {
			auto_attach = false,
			preference = nil,
		},
		highlight = false,
		separator = " > ",
		depth_limit = 0,
		depth_limit_indicator = "..",
		safe_output = true,
		lazy_update_context = false,
		click = false,
		format_text = function(text)
			return text
		end,
	})
	local ready, color = pcall(require, "Eva-Theme.palette")
	if ready then
		local hi = vim.api.nvim_set_hl
		hi(0, "WinBar", { bg = color.background })
		hi(0, "WinBarNC", { bg = color.background })
		hi(0, "StatusLine", { bg = color.background })
		hi(0, "StatusLineNC", { bg = color.background })
	end
end

return M

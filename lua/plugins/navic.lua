local M = {
	"SmiteshP/nvim-navic",
}

function M.config()
	local icons = require("user.icons")
	require("nvim-navic").setup({
		icons = icons.kind,
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
end

return M

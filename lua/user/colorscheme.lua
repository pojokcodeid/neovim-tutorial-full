local colorscheme = "Eva-Dark"
local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
	print("Colorscheme '" .. colorscheme .. "' not found!")
end

local ready, color = pcall(require, "Eva-Theme.palette")
if ready then
	local hi = vim.api.nvim_set_hl
	hi(0, "WinBar", { bg = color.background })
	hi(0, "WinBarNC", { bg = color.background })
	hi(0, "StatusLine", { bg = color.background })
	hi(0, "StatusLineNC", { bg = color.background })
end

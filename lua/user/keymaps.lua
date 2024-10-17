-- definiskanfunction name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space leader keys
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- MODES
-- mormal mode = "n"
-- insert mode = "i"
-- visual mode = "v"
-- visual block mode = "x"
-- term mode = "t"
-- command mode = "c"

for _, mode in ipairs({ "i", "v", "n", "x" }) do
	-- duplicate line
	keymap(mode, "<S-Down>", "<cmd>t.<cr>", opts)
	keymap(mode, "<S-Up>", "<cmd>t -1<cr>", opts)
	-- Move line
	keymap(mode, "<M-Down>", "<cmd>m+<cr>", opts)
	keymap(mode, "<M-Up>", "<cmd>m-2<cr>", opts)
	-- save file
	keymap(mode, "<C-s>", "<cmd>silent! w<cr>", opts)
	-- comment
	keymap(mode, "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
	keymap(mode, "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
end
-- move text visual blok mode
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)
-- duplicate line visual block
keymap("x", "<S-Down>", ":'<,'>t'><cr>", opts)
-- close windows
keymap("n", "q", "<cmd>q<cr>", opts)

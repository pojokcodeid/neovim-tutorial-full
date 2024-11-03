local M = {}

M.lsp_info = function()
	local unique_list = function(list)
		local seen = {}
		local result = {}

		for _, val in ipairs(list) do
			if not seen[val] then
				table.insert(result, val)
				seen[val] = true
			end
		end

		return result
	end
	local msg = "LSP Inactive"
	local buf_ft = vim.bo.filetype
	-- start register
	local buf_clients = {}
	buf_clients = vim.lsp.get_clients({ bufnr = 0 })
	local buf_client_names = {}
	if next(buf_clients) == nil then
		-- TODO: clean up this if statement
		if type(msg) == "boolean" or #msg == 0 then
			return "LSP Inactive"
		end
		-- return msg
		table.insert(buf_client_names, msg)
	end

	-- add client
	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" and client.name ~= "copilot" then
			table.insert(buf_client_names, client.name)
		end
	end

	-- add conform.nvim
	local status, conform = pcall(require, "conform")
	if status then
		local formatters = conform.list_formatters_for_buffer()
		if formatters and #formatters > 0 then
			vim.list_extend(buf_client_names, formatters)
		else
			-- check if lspformat
			local lsp_format = require("conform.lsp_format")
			local bufnr = vim.api.nvim_get_current_buf()
			local lsp_clients = lsp_format.get_format_clients({ bufnr = bufnr })

			if not vim.tbl_isempty(lsp_clients) then
				table.insert(buf_client_names, "lsp_fmt")
			end
		end
	else
		table.insert(buf_client_names, "lsp_fmt")
	end

	-- cek nvimlint
	local lint_s, lint = pcall(require, "lint")
	if lint_s then
		for ft_k, ft_v in pairs(lint.linters_by_ft) do
			if type(ft_v) == "table" then
				for _, ltr in ipairs(ft_v) do
					if buf_ft == ft_k then
						table.insert(buf_client_names, ltr)
					end
				end
			elseif type(ft_v) == "string" then
				if buf_ft == ft_k then
					table.insert(buf_client_names, ft_v)
				end
			end
		end
	end

	-- decomple
	local unique_client_names = unique_list(buf_client_names)
	msg = table.concat(unique_client_names, ", ")
	return msg
end

return M

local colors = {
	CursorLine = { bg = "#241443" },
	NonText = { fg = "#112233" },

	NormalFloat = { bg = "NONE", fg = "#ffffff" },
	FloatBorder = { fg = "#ff55ff" },

	Normal = { bg = "NONE", fg = "#ffffff" },
	Constant = { fg = "#aa55ff" },
	Statement = { bold = true, fg = "#7777ff" },
	PreProc = { fg = "#ff3388" },
	Type = { bold = true, fg = "#44ffaa" },
	Special = { fg = "#ee55aa" },

	-- LSP Messages
	LspInlayHint = { fg = "#888888" },
	DiagnosticError = { fg = "#ff4433" },
	DiagnosticWarn = { fg = "#ffbb22" },
	DiagnosticInfo = { fg = "#88ddff" },
	DiagnosticHint = { fg = "#bbbbbb" },
	DiagnosticOk = { fg = "#22ff22" },

	Comment = { fg = "#888888" },
	["@variable"] = { fg = "#42f4f4" },
	String = { fg = "#ff8888" },
	Identifier = { fg = "#3abefc" },
	Function = { fg = "#ff88ff" },
	Operator = { fg = "#77aaff" },
	Delimiter = { bold = true, fg = "#ff88ff" },
}

for k, v in pairs(colors) do
	vim.api.nvim_set_hl(0, k, v)
end

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		for k, v in pairs(colors) do
			vim.api.nvim_set_hl(0, k, v)
		end
	end
})

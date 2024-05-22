local border = {
	{"╭", "FloatBorder"},
	{"─", "FloatBorder"},
	{"╮", "FloatBorder"},
	{"│", "FloatBorder"},
	{"╯", "FloatBorder"},
	{"─", "FloatBorder"},
	{"╰", "FloatBorder"},
	{"│", "FloatBorder"},
}

---@diagnostic disable-next-line: lowercase-global
__vim_lsp_util_open_floating_preview = __vim_lsp_util_open_floating_preview or vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return __vim_lsp_util_open_floating_preview(contents, syntax, opts, ...)
end

return border

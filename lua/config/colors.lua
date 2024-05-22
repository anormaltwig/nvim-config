local colors = {
	CursorLine = "guibg=#241443",
	NonText = "guifg=#112233",
	LspInlayHint = "guifg=#888888",

	NormalFloat = "guibg=NONE guifg=#ffffff",
	FloatBorder = "guifg=#ff55ff",

	Normal = "guibg=NONE guifg=#ffffff",
	Constant = "guifg=#fc8383",
	Statement = "guifg=#7777ff",

	PreProc = "guifg=#ff3388",
	Type = "gui=bold guifg=#44ffaa",

	Special = "guifg=#ee55aa",

	Comment = "guifg=#888888",
	["@variable"] = "guifg=#66ccff",
	String = "guifg=#ff8888",
	Identifier = "guifg=#ccccff",
	Function = "guifg=#dd77ff",
	Operator = "guifg=#77aaff",
	Delimiter = "guifg=#ffccff",
}

local hi = vim.cmd.highlight
for k, v in pairs(colors) do
	hi(k, v)
end

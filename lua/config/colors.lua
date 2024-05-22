local colors = {
	CursorLine = "guibg=#241443",
	NonText = "guifg=#112233",

	NormalFloat = "guibg=NONE guifg=#ffffff",

	Normal = "guibg=NONE guifg=#ffffff",
	Constant = "guifg=#fc8383",
	Statement = "guifg=#7777ff",

	PreProc = "guifg=#ff33ff",
	Type = "gui=bold guifg=#44ffaa",

	Special = "guifg=#ee55aa",

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

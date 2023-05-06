local vimapi = vim.api

-- Editor Settings
vim.opt.equalalways = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.list = true
vim.opt.listchars = {
	["tab"] = "⟶ ",
	["trail"] = "·",
	["eol"] = "⏎"
}

vim.opt.termguicolors = true

-- Color
vim.cmd("highlight CursorLine guibg=#333343")
vim.cmd("highlight NonText guifg=#182c4d")

-- Vim Plug
local plug = vim.fn["plug#"]
vim.call("plug#begin")
	plug("nvim-lualine/lualine.nvim")

	plug("nvim-tree/nvim-web-devicons")
	plug("nvim-tree/nvim-tree.lua")
vim.call("plug#end")

vim.g.rust_recommended_style = false

-- Plugin Config
require("config.lualine")
require("config.nvim-tree")

vim.api.nvim_create_autocmd({ "VimEnter" }, {callback = function()
	-- Create Terminal Split
	vim.cmd.split()
	vim.cmd.wincmd("j")
	local terminalWindow = vim.api.nvim_get_current_win()
	vim.cmd.resize(10)
	vim.cmd.terminal()
	vim.cmd.wincmd("k")

	vim.api.nvim_create_autocmd({ "WinResized" }, {
		callback = function(event)
			vim.api.nvim_win_call(terminalWindow, function()
				vim.cmd.resize(10)
			end)
		end,
	})
end})


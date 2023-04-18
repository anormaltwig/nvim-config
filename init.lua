-- Editor Settings
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

-- Plugin Config
require("config.lualine")
require("config.nvim-tree")

vim.cmd("NvimTreeOpen")


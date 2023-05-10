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
local highlight = vim.cmd.highlight
highlight("clear Pmenu")
highlight("Pmenu guibg=#1a061d")

highlight("CursorLine guibg=#241443")
highlight("NonText guifg=#182c4d")

-- Vim Plug
local plug = vim.fn["plug#"]
vim.call("plug#begin")
	plug("neovim/nvim-lspconfig")
	plug("hrsh7th/cmp-nvim-lsp")
	plug("hrsh7th/cmp-buffer")
	plug("hrsh7th/cmp-path")
	plug("hrsh7th/cmp-cmdline")
	plug("hrsh7th/nvim-cmp")

	plug("L3MON4D3/LuaSnip")
	plug("saadparwaiz1/cmp_luasnip")

	plug("nvim-lualine/lualine.nvim")

	plug("nvim-tree/nvim-web-devicons")
	plug("nvim-tree/nvim-tree.lua")
vim.call("plug#end")

vim.g.rust_recommended_style = false

-- LSP Config
require("lspconfig")

-- Plugin Config
require("config.nvim-lspconfig")
require("config.lualine")
require("config.nvim-tree")


-- Editor Settings
vim.opt.equalalways = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3

vim.opt.list = true
vim.opt.listchars = {
	["tab"] = "⟶ ",
	["trail"] = "·",
	["eol"] = "⏎"
}

vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"neovim/nvim-lspconfig",

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",

	"nvim-treesitter/nvim-treesitter",

	"nvim-lualine/lualine.nvim",

	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",
})

-- DONT TELL ME HOW TO WRITE MY CODE
-- I WILL USE TABS INSTEAD OF SPACES
vim.g.rust_recommended_style = false
vim.g.python_recommended_style = false

-- Config
require("config.colors")
require("config.border")
require("config.nvim-lspconfig")
require("config.lualine")
require("config.nvim-tree")


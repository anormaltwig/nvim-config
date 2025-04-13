-- Editor Settings
vim.opt.equalalways = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.autoindent = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 0
vim.opt.expandtab = false

vim.opt.list = true
vim.opt.listchars = {
	["tab"] = "⟶ ",
	["trail"] = "·",
	["eol"] = "⏎",
}

vim.opt.termguicolors = true

vim.opt.fileformat = "unix"
vim.opt.fileformats = "unix"

-- DONT TELL ME HOW TO WRITE MY CODE
-- I WILL USE TABS INSTEAD OF SPACES
vim.g.rust_recommended_style = false
vim.g.python_recommended_style = false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"neovim/nvim-lspconfig",

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	"nvim-telescope/telescope.nvim",

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
})

vim.filetype.add({
	extension = {
		vs = "glsl",
		fs = "glsl",
	}
})

-- Tools
require("tools.quickterm")

-- Im not finishing this
-- require("tools.dishwasher")

-- Config
require("config.colors")
require("config.border")
require("config.nvim-lspconfig")
require("config.lualine")
require("config.telescope")
require("config.treesitter")


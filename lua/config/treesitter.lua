require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "rust", "toml", "markdown", "json", "glsl", "html"},
	sync_install = false,
	auto_install = true,
	ignore_install = {},

	modules = {},

	highlight = {
		enable = true,
		disable = { "rust" },
	},
	indent = { enable = true },
})




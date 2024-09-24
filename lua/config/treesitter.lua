require("nvim-treesitter.configs").setup({
	ensure_installed = {},
	ignore_install = {},
	sync_install = false,
	auto_install = false,

	modules = {},

	highlight = {
		enable = true,
		disable = { "rust" },
	},
	indent = { enable = true },
})




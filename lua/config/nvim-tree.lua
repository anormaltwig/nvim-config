vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	git = {
		ignore = false,
	},
})

local nvimtree = require("nvim-tree.api")

vim.api.nvim_create_autocmd({ "VimEnter" }, {callback = function()
	nvimtree.tree.toggle({
		focus = false,
	})
end})


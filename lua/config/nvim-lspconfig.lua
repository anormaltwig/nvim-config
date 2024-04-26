local luasnip = require("luasnip")

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(a) return luasnip.lsp_expand(a.body) end,
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<S-Tab>"] = cmp.mapping(function()
			vim.lsp.buf.hover()
		end),
		["<C-Space>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Lua
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
	capabilities = cmp_nvim_lsp.default_capabilities(),
})

-- ASM
lspconfig.asm_lsp.setup({
	capabilities = cmp_nvim_lsp.default_capabilities(),
})

-- C/C++
lspconfig.clangd.setup({
	capabilities = cmp_nvim_lsp.default_capabilities(),
})

-- C#
lspconfig.csharp_ls.setup({
	capabilities = cmp_nvim_lsp.default_capabilities(),
})

-- Go (Please)
lspconfig.gopls.setup({
	capabilities = cmp_nvim_lsp.default_capabilities(),
})

-- Python
lspconfig.pylsp.setup({
	capabilities = cmp_nvim_lsp.default_capabilities(),

	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {
						-- Ignore conventions that are stupid.
						"E302",
						"E305",
						"W391",
						"W191",
					},
				},
			},
		},
	},
})

-- Rust
require("rust-tools").setup({
	capabilities = cmp_nvim_lsp.default_capabilities(),

	server = {
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
			},
		},
	},
})

-- TypeScript
lspconfig.tsserver.setup({
	capabilities = cmp_nvim_lsp.default_capabilities(),
})

-- WGSL
lspconfig.wgsl_analyzer.setup({
	capabilities = cmp_nvim_lsp.default_capabilities(),
})


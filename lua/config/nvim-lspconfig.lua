local luasnip = require("luasnip")

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(a) return luasnip.lsp_expand(a.body) end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
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
local capabilities = cmp_nvim_lsp.default_capabilities()

local function attach(client, _)
	vim.lsp.inlay_hint.enable(client.server_capabilities.inlayHintProvider and true)
end

-- Lua
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	capabilities = capabilities,
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
})

-- ASM
lspconfig.asm_lsp.setup({
	capabilities = capabilities,
})

-- C/C++
lspconfig.clangd.setup({
	capabilities = capabilities,
})

-- C#
lspconfig.csharp_ls.setup({
	capabilities = capabilities,
})

-- Go (Please)
lspconfig.gopls.setup({
	capabilities = capabilities,
})

-- Python
lspconfig.pylsp.setup({
	capabilities = capabilities,
	settings = { pylsp = { plugins = { pycodestyle = { ignore = {
		-- Ignore conventions that are stupid.
		"E302",
		"E305",
		"W391",
		"W191",
	}}}}}
})

-- Rust
local reloaded_hints = false
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = attach,
	handlers = {
		["experimental/serverStatus"] = function(_, result, ctx, _)
			if result.quiescent and not reloaded_hints then
				for _, bufnr in ipairs(vim.lsp.get_buffers_by_client_id(ctx.client_id)) do
					vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
				reloaded_hints = true
			end
		end,
	},
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
		},
	},
})

-- TypeScript
lspconfig.tsserver.setup({
	capabilities = capabilities,
})

-- WGSL
lspconfig.wgsl_analyzer.setup({
	capabilities = capabilities,
})


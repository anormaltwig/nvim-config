local colors = {
	normal  = '#1692ba',
	insert  = '#ca1243',
	visual  = '#fe8019',
	replace = '#aa32e6',
	command = '#12db95',

	white = '#f3f3f3',
	grey  = '#7f7f7f',
	black = '#000000',

	red = "#e03c34",
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.normal },
		b = { fg = colors.white, bg = colors.grey   },
		c = { fg = colors.white, bg = colors.black  },
		d = { fg = colors.black, bg = colors.black  },
		x = { fg = colors.grey,  bg = colors.black  },
		y = { fg = colors.white, bg = colors.grey   },
		z = { fg = colors.black, bg = colors.normal    },
	},
	insert =  { a = { fg = colors.black, bg = colors.insert  } },
	visual =  { a = { fg = colors.black, bg = colors.visual  } },
	replace = { a = { fg = colors.black, bg = colors.replace } },
	command = { a = { fg = colors.black, bg = colors.command } },
}

require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = '\\', right = '/'},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})


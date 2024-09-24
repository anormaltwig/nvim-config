local border = require("config.border")

local dishwasher = {}

function dishwasher:open()
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)

	local x_pad = (vim.o.columns - width) / 2
	local y_pad = (vim.o.lines - height) / 2

	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, {
		title = "Dishwasher",
		title_pos = "center",

		relative = "editor",
		col = x_pad,
		row = y_pad,
		width = width,
		height = height,

		style = "minimal",
		border = border,
	})

	vim.api.nvim_set_option_value("buftype", "acwrite", { buf = buf })

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
		"Penis",
		"Penis2",
		"Penis3",
	})

	vim.api.nvim_create_autocmd("BufLeave", {
		callback = function()
			vim.api.nvim_win_close(win, true)
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	})
end

vim.keymap.set("n", "<C-g>", function()
	dishwasher:open()
end)

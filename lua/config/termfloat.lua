local border = require("config.border")

local function open_float(opts)
	local buf = vim.api.nvim_create_buf(true, true)
	local win = vim.api.nvim_open_win(buf, true, opts)

	return win, buf
end

vim.keymap.set({"n", "i"}, "<C-e>", function()
	local ui = vim.api.nvim_list_uis()[1]

	local width = math.floor(ui.width * 0.5)
	local height = math.floor(ui.height * 0.5)

	local win, buf = open_float({
		relative = "cursor",
		row = 0,
		col = 0,
		width = width,
		height = height,
		border = border,
	})

	vim.fn.termopen("zsh", {
		on_exit = function()
			vim.api.nvim_buf_delete(buf, { force = true })
			vim.api.nvim_win_close(win, true)
		end,
	})
	vim.api.nvim_feedkeys("i", "m", false)
end)


local border = require("config.border")

local dishwasher = {}

function dishwasher:active()
	return self.files and vim.api.nvim_win_is_valid(self.files[1])
end

function dishwasher:open()
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)

	local x_pad = (vim.o.columns - width) / 2
	local y_pad = (vim.o.lines - height) / 2

	local files_buf = vim.api.nvim_create_buf(false, true)
	local files_win = vim.api.nvim_open_win(files_buf, true, {
		title = "Dishwasher",
		title_pos = "center",

		relative = "editor",
		col = x_pad,
		row = y_pad,
		width = width,
		height = height - 3,

		style = "minimal",
		border = border,
	})

	vim.api.nvim_buf_set_lines(files_buf, 0, -1, false, {
		"One",
		"Two",
		"Three",
		"Four",
	})

	local prompt_buf = vim.api.nvim_create_buf(false, true)
	local prompt_win = vim.api.nvim_open_win(prompt_buf, true, {
		title = "Input",
		title_pos = "center",

		relative = "editor",
		col = x_pad,
		row = y_pad + height - 1,
		width = width,
		height = 1,

		border = border,
	})

	vim.api.nvim_set_option_value("buftype", "prompt", { buf = prompt_buf })

	self.files = { files_win, files_buf }
	self.prompt = { prompt_win, prompt_buf }
end

function dishwasher:close()
	vim.api.nvim_win_close(self.files[1], true)
	vim.api.nvim_buf_delete(self.files[2], { force = true })

	vim.api.nvim_win_close(self.prompt[1], true)
	vim.api.nvim_buf_delete(self.prompt[2], { force = true })

	self.files = nil
	self.prompt = nil
end

function dishwasher:toggle()
	if self:active() then
		dishwasher:close()
	else
		dishwasher:open()
	end
end

vim.keymap.set("n", "<C-g>", function()
	dishwasher:toggle()
end)

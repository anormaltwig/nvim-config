local border = require("config.border")

local netrw_popup = {}

function netrw_popup:active()
	return self.window and vim.api.nvim_win_is_valid(self.window[1])
end

function netrw_popup:open()
	if self:active() then return end

	local width = math.floor(vim.o.columns * 0.5)
	local height = math.floor(vim.o.lines * 0.5)

	local buf = vim.api.nvim_create_buf(true, true)
	local win = vim.api.nvim_open_win(buf, true, {
		title = "Netrw Popup",
		title_pos = "center",

		relative = "cursor",
		col = 0,
		row = 0,
		width = width,
		height = height,

		border = border,
		noautocmd = true,
	})

	vim.api.nvim_buf_call(buf, function()
		vim.api.nvim_cmd({
			cmd = "edit",
			args = { "." },
		}, {})
	end)

	self.window = { win, buf }

	self.buf_leave = vim.api.nvim_create_autocmd("BufLeave", {
		callback = function()
			self:close()
		end
	})
end

function netrw_popup:close()
	if not self:active() then return end

	vim.api.nvim_del_autocmd(self.buf_leave);

	vim.api.nvim_win_close(self.window[1], true)
	vim.api.nvim_buf_delete(self.window[2], { force = true })

	self.window = nil
end

function netrw_popup:toggle()
	return self:active() and self:close() or self:open()
end

vim.keymap.set({"n", "i"}, "<C-g>", function()
	netrw_popup:toggle()
end)


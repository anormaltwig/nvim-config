local border = require("config.border")

local shell = os.getenv("SHELL") or "bash"

local quickterm = {}

function quickterm:active()
	return self.window and vim.api.nvim_win_is_valid(self.window[1])
end

function quickterm:open()
	if self:active() then return end

	local width = math.floor(vim.o.columns * 0.5)
	local height = math.floor(vim.o.lines * 0.5)

	local buf = vim.api.nvim_create_buf(true, true)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "cursor",
		col = 0,
		row = 0,
		width = width,
		height = height,

		border = border,
		noautocmd = true,
	})

	self.window = { win, buf }

	vim.fn.termopen(shell, {
		on_exit = function()
			self:close()
		end,
	})
	vim.cmd.startinsert()

	self.buf_leave = vim.api.nvim_create_autocmd("BufLeave", {
		callback = function()
			self:close()
		end
	})
end

function quickterm:close()
	if not self:active() then return end

	vim.api.nvim_del_autocmd(self.buf_leave);

	vim.api.nvim_win_close(self.window[1], true)
	vim.api.nvim_buf_delete(self.window[2], { force = true })

	self.window = nil
end

function quickterm:toggle()
	return self:active() and self:close() or self:open()
end

vim.keymap.set({"n", "t"}, "<C-e>", function()
	quickterm:toggle()
end)


local border = require("config.border")

local quickterm = { cmds = {} }

function quickterm:open()
	local ui = vim.api.nvim_list_uis()[1]

	local width = math.floor(ui.width * 0.5)
	local height = math.floor(ui.height * 0.5)

	local buf = vim.api.nvim_create_buf(true, true)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "cursor",
		row = 0,
		col = 0,
		width = width,
		height = height,
		border = border,
		noautocmd = true,
	})

	self.window = { win, buf }

	vim.fn.termopen("zsh", {
		on_exit = function()
			self:close()
		end,
	})
	vim.api.nvim_feedkeys("i", "m", false)

	local function cmd(autocmd)
		table.insert(self.cmds, autocmd)
	end

	cmd(vim.api.nvim_create_autocmd("ModeChanged", {
		callback = function(data)
			if string.sub(data.match, 1, 2) == "t:" then
				self:close()
			end
		end
	}))

	cmd(vim.api.nvim_create_autocmd("BufLeave", {
		callback = function() end
	}))
end

function quickterm:close()
	if not self:active() then return end

	for _ = 1, #self.cmds do
		local autocmd = table.remove(self.cmds, #self.cmds)
		vim.api.nvim_del_autocmd(autocmd)
	end

	vim.api.nvim_win_close(self.window[1], true)
	vim.api.nvim_buf_delete(self.window[2], { force = true })

	self.window = nil
end

function quickterm:active()
	return self.window and vim.api.nvim_win_is_valid(self.window[1])
end

vim.keymap.set({"n", "i"}, "<C-e>", function()
	quickterm:open()
end)

vim.keymap.set("t", "<esc>", function()
	if quickterm:active() then
		quickterm:close()
	end
end)


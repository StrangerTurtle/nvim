require('mini.files').setup()

local minifiles_toggle = function()
	if not MiniFiles.close() then
		MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
	end
end

vim.keymap.set('n', '<leader>mf', minifiles_toggle)

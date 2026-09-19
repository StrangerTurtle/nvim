-- Parenthesis
-- no longer active b/c got in the way might try to fix later on
vim.keymap.set("i", "(", function()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local next_char = line:sub(col+1, col+1)
	return (next_char:match("[%w_]") and "(<Esc>Ea)") or "()<Left>"
end, { expr = true })

vim.keymap.set("i", "[", function()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local next_char = line:sub(col+1, col+1)
	return (next_char:match("[%w_]") and "[<Esc>Ea]") or "[]<Left>"
end, { expr = true })

local function skip_ender(char)
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	return (line:sub(col+1, col+1) == char and "<Right>") or char
end

vim.keymap.set("i", ")", function()
	return skip_ender(")")
end, { expr = true})

vim.keymap.set("i", "]", function()
	return skip_ender("]")
end, { expr = true })

vim.keymap.set("i", '"', function()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local next_char = line:sub(col+1, col+1)
	return (next_char:match("[%w_]") and '"<Esc>Ea"') or (next_char == '"' and "<Right>") or '""<Left>'
end, { expr = true })

vim.keymap.set("i", "'", function()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local next_char = line:sub(col+1, col+1)
	return (line:sub(col, col):match("[%w]") and "'") or (next_char:match("[%w_]") and "'<Esc>Ea'") or (next_char == "'" and "<Right>") or "''<Left>"
end, { expr = true })

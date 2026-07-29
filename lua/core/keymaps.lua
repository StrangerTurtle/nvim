vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- use only if minifiles stops working
vim.keymap.set("n", "<leader>er", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>h", vim.cmd.noh)
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { silent = true })
vim.keymap.set("n", "<leader>name", "a/*<CR><CR>/<Up> Michael Kepler<Esc>Go<CR>public class ")
-- n <leader>mf is minifiles_toggle
-- n <leader>ff is find_files
-- n <leader>mf is grep telescope

--vim.keymap.set("i", "{", "{<CR>}<Esc>O") --makes typing funcitons easier
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")
vim.keymap.set("n", "<C-;>", "mlA;<Esc>`l:delm l<CR>", { silent = true })

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

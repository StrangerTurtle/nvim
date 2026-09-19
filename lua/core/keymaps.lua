vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- use only if minifiles stops working
vim.keymap.set("n", "<leader>er", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>h", vim.cmd.noh)
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { silent = true })
vim.keymap.set("n", "<leader>name", "a/*<CR><CR>/<Up> Michael Kepler<Esc>Go<CR>public class ") -- for creating files in comp sci
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")
-- n <leader>mf is minifiles_toggle
-- n <leader>ff is find_files
-- n <leader>gf is grep telescope

vim.api.nvim_create_user_command("W", "write", {}) --just so useful
vim.api.nvim_create_user_command("Doc", "e /mnt/data/Documents", {})

vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O") --makes typing funcitons easier
--vim.keymap.set("n", "<C-;>", "mlA;<Esc>`l:delm l<CR>", { silent = true }) --adding semicolons
vim.keymap.set({"i", "n"}, "<C-;>", "<Esc>mlA;<Esc>`l:delm l<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<LeftMouse>", "<Nop>")
-- require("parenthesis")

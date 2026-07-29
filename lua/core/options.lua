vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.cmd("set fo-=cro") --stops commenting from going to next line
vim.opt.ttyfast = true

vim.opt.smarttab = true
vim.opt.numberwidth = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.termguicolors = true
vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	signs = true,
	underline = true,
})
vim.opt.completeopt = { "menu", "preview", "longest", "preinsert", "menuone", "fuzzy" }
vim.opt.shortmess:append("A") --hides the annoying file replace everytime thing
vim.diagnostic.show()

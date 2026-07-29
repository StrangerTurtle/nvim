return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		treesitter = require("nvim-treesitter")
		treesitter.setup({

			ensure_installed = {
				"bash",
				"c",
				"css",
				"java",
				"python",
				"lua",
				"javascript",
				"typescript",
				"html",
				"json",
				"toml",
				"go",
				"cpp",
				"markdown",
				"markdown_inline",
				"rust",
			},
			auto_install = true,
			highlight = {enable = true},
			indent = {enable = true},
		})
		end,
	}

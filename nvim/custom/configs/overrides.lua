local M = {}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- other stuff
		"bash-language-server",
		"pylint",
		"rust-analyzer",
		"gopls",
		"markdownlint",
		"dprint",
		"shfmt",

		-- webdev stuff
		"css-lsp",
		"eslint-lsp",
		"html-lsp",
		"prettierd",
		"typescript-language-server",
	},
}

M.treesitter = {
	ensure_installed = {
		"cpp",
		"dockerfile",
		"vim",
		"lua",
		"html",
		"css",
		"go",
		"javascript",
		"typescript",
		"tsx",
		"toml",
		"json",
		"rust",
		"markdown",
		"markdown_inline",
	},
	autotag = {
		enable = true,
	},
	indent = {
		enable = true,
	},
}

-- git support in nvimtree
M.nvimtree = {
	filters = {
		custom = { "node_modules", ".git" },
	},
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.telescope = {
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	defaults = {
		file_ignore_patterns = { ".git", "node_modules" },
	},
}

M.cmp = {
	sorting = {
		priority_weight = 2,
		comparators = require("custom.configs.cmp").comparators,
	},
}

return M

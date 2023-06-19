local M = {}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- other stuff
		"bash-language-server",
		"beautysh",
		"shellcheck",
		"shellfmt",
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
		"lua",
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

M.nvim_surround = {}

M.telescope = {
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	defaults = {
		file_ignore_patterns = { ".git", "node_modules" },
	},
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			-- find command (defaults to `fd`)
			find_cmd = "rg",
		},
	},
}

M.cmp = {
	sorting = {
		priority_weight = 2,
		comparators = require("custom.configs.cmp").comparators,
	},
}

return M

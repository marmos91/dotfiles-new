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

        -- webdev stuff
		"css-lsp",
        "eslint-lsp",
		"html-lsp",
        "prettier",
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
        enable = true
    },
	indent = {
		enable = true,
	},
}

-- git support in nvimtree
M.nvimtree = {
	filters = {
		dotfiles = true,
		custom = { "node_modules" },
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
	extensions = { "media_files" },
}

return M

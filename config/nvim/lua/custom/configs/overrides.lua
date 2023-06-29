local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

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
		"pylint",
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

M.rust_tools = {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
}

M.crates = {
	null_ls = {
		enabled = true,
		name = "crates.nvim",
	},
}

M.ufo = {
	provider_selector = function()
		return { "treesitter", "indent" }
	end,
}

-- M.typescript = {
-- 	separate_diagnostic_server = true,
-- 	tsserver_plugins = {
-- 		"typescript-styled-plugin",
-- 	},
-- 	tsserver_format_options = {
-- 		enable = true,
-- 		insertSpaceAfterCommaDelimiter = true,
-- 		insertSpaceAfterConstructor = false,
-- 		insertSpaceAfterFunctionKeywordForAnonymousFunctions = false,
-- 		insertSpaceAfterKeywordsInControlFlowStatements = false,
-- 		insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
-- 		insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
-- 		insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
-- 		insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
-- 		insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
-- 		insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
-- 		insertSpaceAfterSemicolonInForStatements = true,
-- 		insertSpaceAfterTypeAssertion = false,
-- 		insertSpaceBeforeAndAfterBinaryOperators = true,
-- 		insertSpaceBeforeFunctionParenthesis = false,
-- 		placeOpenBraceOnNewLineForControlBlocks = true,
-- 		placeOpenBraceOnNewLineForFunctions = true,
-- 		semicolons = "ignore",
-- 	},
-- }

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
	sources = { name = "crates" },
	sorting = {
		priority_weight = 2,
		comparators = require("custom.configs.cmp").comparators,
	},
}

return M

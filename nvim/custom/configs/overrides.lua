local cmp = require("cmp")
local types = require("cmp.types")

-- deprioritize snippets ove normal lsp completions
local function deprioritize_snippet(entry1, entry2)
	if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return false
	end
	if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return true
	end
end

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
		-- deprioritize snippets over lsp
		priority_weight = 2,
		comparators = {
			deprioritize_snippet,
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.scopes,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
}

return M

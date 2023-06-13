local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"wfxr/minimap.vim",
		lazy = false,
		init = function()
			vim.g.minimap_width = 10
			vim.g.minimap_auto_start = 1
			vim.g.minimap_auto_start_win_enter = 1
			vim.g.minimap_git_colors = 1
			vim.g.minimap_highlight_search = 1
		end,
	},
	{
		"bazelbuild/vim-bazel",
		dependencies = "google/vim-maktaba",
		lazy = false,
	},
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = overrides.nvim_surround,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = overrides.telescope,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		lazy = false,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},
}

return plugins

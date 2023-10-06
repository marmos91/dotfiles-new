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
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
		tag = "v0.3.0",
		ft = { "rust", "toml" },
		dependencies = "nvim-lua/plenary.nvim",
		opts = overrides.crates,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = overrides.rust_tools,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		lazy = false,
		config = function(_, opts)
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
			require("dapui").setup(opts)
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
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
		},
		lazy = false,
		opts = overrides.ufo,
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
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("media_files")
		end,
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
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
		"apzelos/blamer.nvim",
		lazy = false,
		init = function(_)
			vim.g.blamer_enabled = 1
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},
	{
		"davidgranstrom/nvim-markdown-preview",
		lazy = false,
	},
	{
		"eandrju/cellular-automaton.nvim",
		lazy = false,
	},
}

return plugins

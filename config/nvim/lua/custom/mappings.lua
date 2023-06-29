---@type MappingsTable
local M = {}

M.general = {
	n = {
		-- Tmux motions
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

		-- lazygit stuff
		["<leader>gg"] = { "<cmd> LazyGit<CR> " },

		-- Keep clipboard register while pasting
		["<leader>p"] = { '"_dP' },

		-- move by page while centering cursor
		["<C-d>"] = { "<C-d>zz", "go down half page" },
		["<C-u>"] = { "<C-u>zz", "go up half page" },
	},
	i = {
		-- move a line up/down
		["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "move line down" },
		["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "move line up" },
	},
	v = {
		-- move a line up/down
		["<S-j>"] = { ":m '>+1<CR>gv=gv" },
		["<S-k>"] = { ":m '<-2<CR>gv=gv" },
M.crates = {
	n = {
		["<leader>rcu"] = {
			function()
				require("crates").upgrade_all_crates()
			end,
			"Update crates",
		},
	},
}

M.telescope = {
	n = {
		["<leader>fd"] = { "<cmd> Telescope media_files<CR>", "Find media files" },
		["<leader>fg"] = { "<cmd> Telescope git_files<CR>", "Find git files" },
		["<leader>fc"] = { "<cmd> Telescope commands<CR>", "Find vim commands" },
	},
}

return M

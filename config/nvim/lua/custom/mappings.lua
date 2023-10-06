---@type MappingsTable
local M = {}

M.general = {
	n = {
		-- Tmux motions
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },

		-- lazygit stuff
		["<leader>gg"] = { "<cmd> LazyGit<CR> ", "Open LazyGit" },

		-- Keep clipboard register while pasting
		["<leader>p"] = { '"_dP', "Keep register while pasting" },

		-- move by page while centering cursor
		["<C-d>"] = { "<C-d>zz", "Go down half page" },
		["<C-u>"] = { "<C-u>zz", "Go up half page" },

		-- Useless stuff
		["<leader>fml"] = { "<cmd> CellularAutomaton make_it_rain<CR>", "F**k my life" },
	},
	i = {
		-- move a line up/down
		["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "Move line down" },
		["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "Move line up" },
	},
	v = {
		-- move a line up/down
		["<S-j>"] = { ":m '>+1<CR>gv=gv", "Move line down" },
		["<S-k>"] = { ":m '<-2<CR>gv=gv", "Move line up" },
	},
}

M.dap = {
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint" },
		["<leader>dut"] = {
			function()
				require("dapui").toggle()
			end,
			"Toggle DAP UI interface",
		},
		["<leader>duk"] = {
			function()
				require("dapui").eval()
			end,
			"Toggle DAP UI dialog",
		},
	},
}

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

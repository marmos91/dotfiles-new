---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "catppuccin",
	statusline = {
		theme = "vscode",
	},
	hl_override = {
		NvDashAscii = {
			fg = "blue",
			bg = "none",
		},

		NvDashButtons = {
			fg = "light_grey",
			bg = "none",
		},
	},
	nvdash = {
		load_on_startup = true,
	},
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M

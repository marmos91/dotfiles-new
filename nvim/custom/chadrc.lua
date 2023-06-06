---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "catppuccin",
	statusline = {
		theme = "vscode",
	},
	nvdash = {
		load_on_startup = true,
	},
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M

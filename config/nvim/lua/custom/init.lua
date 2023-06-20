require("custom.autocmds")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"

-- OSC52 clipboard (https://github.com/ojroques/vim-oscyank/issues/24#issuecomment-1098406019)
local function copy(lines, _)
	vim.fn.OSCYankString(table.concat(lines, "\n"))
end

local function paste()
	return {
		vim.fn.split(vim.fn.getreg(""), "\n"),
		vim.fn.getregtype(""),
	}
end

vim.g.clipboard = {
	name = "osc52",
	copy = {
		["+"] = copy,
		["*"] = copy,
	},
	paste = {
		["+"] = paste,
		["*"] = paste,
	},
}

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "Tiltfile",
	command = "setfiletype bzl",
})

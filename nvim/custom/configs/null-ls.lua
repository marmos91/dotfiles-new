local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local lsp_formatting = function(buffer)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		buffer = buffer,
	})
end

local builtins = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
	-- webdev stuff
	builtins.formatting.prettierd.with({
		filetypes = {
			"html",
			"markdown",
			"css",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
		},
	}),

	-- Lua
	builtins.formatting.stylua,

	-- eslint_d
	builtins.diagnostics.eslint_d.with({
		diagnostics_format = "[eslint] #{m}\n(#{c})",
	}),
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client, buffer)
		-- Format on save
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = buffer,
				callback = function()
					lsp_formatting(buffer)
				end,
			})
		end
	end,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })

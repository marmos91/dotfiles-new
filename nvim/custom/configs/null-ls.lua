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
local custom_formatters = require("custom.formatters")
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local sources = {
	-- formatting
	builtins.formatting.prettierd.with({
		filetypes = {
			"html",
			"markdown",
			"css",
			"scss",
		},
	}),
	builtins.formatting.fixjson,
	builtins.formatting.stylua,
	builtins.formatting.shfmt,
	custom_formatters.prettier_eslint.with({
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	}),
	custom_formatters.prettier_eslint_json,

	-- diagnostics
	builtins.diagnostics.eslint_d.with({
		diagnostics_format = "[eslint] #{m}\n(#{c})",
	}),
	builtins.diagnostics.shellcheck,
	builtins.diagnostics.markdownlint,
	builtins.diagnostics.buildifier,
	builtins.diagnostics.commitlint,
	builtins.diagnostics.editorconfig_checker,
	builtins.diagnostics.luacheck,
	builtins.diagnostics.sqlfluff,

	-- code actions
	builtins.code_actions.shellcheck,
	builtins.code_actions.eslint_d,
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

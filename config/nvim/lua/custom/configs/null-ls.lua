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
	builtins.formatting.stylua,
	builtins.formatting.shfmt,
	builtins.formatting.dprint.with({
		filetypes = {
			"typescript",
			"javascript",
			"json",
		},
	}),

	-- diagnostics
	builtins.diagnostics.shellcheck,
	builtins.diagnostics.markdownlint,
	builtins.diagnostics.buildifier,
	builtins.diagnostics.commitlint,
	builtins.diagnostics.editorconfig_checker,
	builtins.diagnostics.luacheck.with({
		extra_args = { "--globals", "vim" },
	}),
	builtins.diagnostics.eslint.with({
		diagnostics_format = "[eslint] #{m}\n(#{c})",
		condition = function(utils)
			return utils.root_has_file({
				".eslintrc",
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc.json",
			})
		end,
	}),

	-- code actions
	builtins.code_actions.shellcheck,
	builtins.code_actions.eslint.with({
		diagnostics_format = "[eslint] #{m}\n(#{c})",
		condition = function(utils)
			return utils.root_has_file({
				".eslintrc",
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc.json",
			})
		end,
	}),

	-- completion
	builtins.completion.luasnip,
	builtins.completion.tags,
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

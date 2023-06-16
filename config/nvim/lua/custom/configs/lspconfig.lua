local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "gopls", "bashls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.tsserver.setup({
	on_attach = function(client)
		-- Temporary disabling this due to a bug with tsserver indentation
		-- disable formatting for tsserver
		client.server_capabilities.documentFormattingProvider = false
	end,
})

local types = require("cmp.types")
local cmp = require("cmp")

local M = {}

-- deprioritize snippets over normal lsp completions
local function deprioritize_snippet(entry1, entry2)
	if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return false
	end
	if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return true
	end
end

M.comparators = {
	deprioritize_snippet,
	cmp.config.compare.offset,
	cmp.config.compare.exact,
	cmp.config.compare.scopes,
	cmp.config.compare.score,
	cmp.config.compare.recently_used,
	cmp.config.compare.locality,
	cmp.config.compare.kind,
	cmp.config.compare.sort_text,
	cmp.config.compare.length,
	cmp.config.compare.order,
}

return M

local present = pcall(require, "null-ls")

if not present then
	return
end

local helpers = require("null-ls.helpers")
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")
local utils = require("null-ls.utils")
local FORMATTING = methods.internal.FORMATTING

local M = {}

-- Define javascript formatter

M.prettier_eslint = helpers.make_builtin({
	name = "prettier_eslint",
	meta = {
		url = "https://github.com/prettier/prettier-eslint-cli",
		description = "Eslint + Prettier",
	},
	method = FORMATTING,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"jsx",
	},
	factory = helpers.formatter_factory,
	generator_opts = {
		command = "prettier-eslint",
		args = { "--stdin", "--stdin-filepath", "$FILENAME" },
		to_stdin = true,
        check_exit_code = function(code)
            return code <= 1
        end,
        use_cache = true,
        dynamic_command = cmd_resolver.from_node_modules(),
        cwd = helpers.cache.by_bufnr(function(params)
            return utils.root_pattern(
                -- https://eslint.org/docs/latest/user-guide/configuring/configuration-files-new
                "eslint.config.js",
                -- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
                ".eslintrc",
                ".eslintrc.js",
                ".eslintrc.cjs",
                ".eslintrc.yaml",
                ".eslintrc.yml",
                ".eslintrc.json",
                "package.json"
            )(params.bufname)
        end),
	},
})

-- Define json formatter

M.prettier_eslint_json = helpers.make_builtin({
    name = "prettier_eslint_json",
    meta = {
        url = "https://github.com/prettier/prettier-eslint-cli",
        description = "Eslint + Prettier",
    },
    method = FORMATTING,
    filetypes = {
        "json",
        "cjson",
    },
    factory = helpers.formatter_factory,
    generator_opts = {
        command = "prettier-eslint",
        args = {"--stdin", "--parser", "json"},
        to_stdin = true,
    }
})

return M

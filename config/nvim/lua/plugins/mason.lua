return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                -- lua stuff
                "lua-language-server",
                "stylua",

                -- other stuff
                "bash-language-server",
                "beautysh",
                "shellcheck",
                "pylint",
                "gopls",
                "markdownlint",
                "marksman",
                "dprint",
                "shfmt",

                -- webdev stuff
                "css-lsp",
                "eslint-lsp",
                "html-lsp",
                "prettierd",
                "typescript-language-server",
            })
        end,
    },
}

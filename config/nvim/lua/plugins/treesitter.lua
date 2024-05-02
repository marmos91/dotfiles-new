return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "lua",
                "css",
                "cpp",
                "go",
                "javascript",
                "typescript",
                "tsx",
                "toml",
                "json",
                "rust",
                "swift",
                "markdown",
                "markdown_inline",
            },
        },
        autotag = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)

            -- MDX
            vim.filetype.add({
                extension = {
                    mdx = "mdx",
                },
            })
            vim.treesitter.language.register("markdown", "mdx")
        end,
    },
}

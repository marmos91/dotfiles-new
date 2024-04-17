return {
    {
        "bazelbuild/vim-bazel",
        dependencies = "google/vim-maktaba",
        lazy = false,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
    },
    {
        "apzelos/blamer.nvim",
        lazy = false,
        init = function(_)
            vim.g.blamer_enabled = 1
        end,
    },
}

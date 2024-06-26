return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/vaults/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/vaults/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        workspaces = {
            {
                name = "cubbit",
                path = "~/vaults/cubbit",
            },
        },
    },
}

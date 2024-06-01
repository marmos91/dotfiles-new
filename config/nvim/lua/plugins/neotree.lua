return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
        {
            "<c-n>",
            function()
                require("neo-tree.command").execute({ toggle = true, reveal = true })
            end,
            desc = "Explorer NeoTree (Root Dir)",
        },
    },
}

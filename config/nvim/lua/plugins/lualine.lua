return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            { "ofseed/copilot-status.nvim" },
        },
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
            },
            sections = {
                lualine_x = {
                    "copilot",
                    "filetype",
                    "fileformat",
                    "encoding",
                },
            },
        },
    },
}

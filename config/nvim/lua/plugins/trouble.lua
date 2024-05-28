return {
    {
        "folke/trouble.nvim",
        keys = {
            {
                "<leader>xx",
                function()
                    require("trouble").toggle("document_diagnostics")
                end,
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                function()
                    require("trouble").toggle("workspace_diagnostics")
                end,
                desc = "Workspace Diagnostics (Trouble)",
            },
        },
        opts = {
            auto_preview = false,
            auto_fold = true,
            use_lsp_signs = true,
        },
    },
}

return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        opts = {
            -- See Configuration section for rest
        },
        keys = {
            {
                "<leader>cc",
                function()
                    require("CopilotChat").toggle()
                end,
                mode = "",
                desc = "[C]opilot [C]hat toggle",
            },
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
}

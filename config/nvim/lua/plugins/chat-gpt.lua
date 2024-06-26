return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        require("chatgpt").setup({
            api_key_cmd = "pass show personal/neovim/chatgpt",
            chat = {
                keymaps = {
                    new_session = "<C-a>",
                },
            },
        })
    end,
    keys = {
        {
            "<leader>cc",
            "<cmd>ChatGPT<CR>",
            desc = "[ChatGPT] Open Chat",
            { "n", "v" },
        },
        {
            "<leader>ce",
            "<cmd>ChatGPTEditWithInstruction<CR>",
            desc = "[ChatGPT] Edit with Instructions",
            { "n", "v" },
        },
        {
            "<leader>ct",
            "<cmd>ChatGPTRun translate<CR>",
            desc = "[ChatGPT] Translate",
            { "n", "v" },
        },
        {
            "<leader>cf",
            "<cmd>ChatGPTRun fix_bugs<CR>",
            desc = "[ChatGPT] Fix Bugs",
            { "n", "v" },
        },
        {
            "<leader>cx",
            "<cmd>ChatGPTRun explain_code<CR>",
            desc = "[ChatGPT] Explain code",
            { "n", "v" },
        },
        {
            "<leader>co",
            "<cmd>ChatGPTRun optimize_code<CR>",
            desc = "[ChatGPT] Optimize Code",
            { "n", "v" },
        },
        {
            "<leader>cs",
            "<cmd>ChatGPTRun summarize<CR>",
            desc = "[ChatGPT] Summarize",
            { "n", "v" },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim",
    },
}

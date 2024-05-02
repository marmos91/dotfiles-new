return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local harpoon = require("harpoon")
            local conf = require("telescope.config").values

            harpoon:setup({
                settings = {
                    save_on_toggle = true, -- Save state on window toggle
                },
            })

            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers")
                    .new({}, {
                        prompt_title = "Harpoon",
                        finder = require("telescope.finders").new_table({
                            results = file_paths,
                        }),
                        previewer = conf.file_previewer({}),
                        sorter = conf.generic_sorter({}),
                    })
                    :find()
            end

            --stylua: ignore
            vim.keymap.set("n", "<leader>hh", function() toggle_telescope(require("harpoon"):list()) end, { desc = "Open harpoon window" })
        end,
        keys = function()
            local keys = {
                {
                    "<leader>ha",
                    function()
                        require("harpoon"):list():add()
                    end,
                    desc = "Add file to harpoon",
                },
                {
                    "<leader>hc",
                    function()
                        require("harpoon"):list():clear()
                    end,
                    desc = "Clear harpoon list",
                },
                {
                    "<leader>hj",
                    function()
                        require("harpoon"):list():next()
                    end,
                    desc = "Cycle next harpoon mark",
                },
                {
                    "<leader>hg",
                    function()
                        require("harpoon"):list():prev()
                    end,
                    desc = "Cycle previous harpoon mark",
                },
            }

            for i = 1, 5 do
                table.insert(keys, {
                    "<leader>h" .. i,
                    function()
                        require("harpoon"):list():select(i)
                    end,
                    desc = "Harpoon to File " .. i,
                })
            end
            return keys
        end,
    },
    {
        "folke/which-key.nvim",
        optional = true,
        opts = {
            defaults = {
                ["<leader>h"] = { name = "harpoon" },
            },
        },
    },
}

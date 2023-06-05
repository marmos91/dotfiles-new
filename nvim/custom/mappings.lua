local M = {}

M.general = {
  n = {
    -- Tmux motions
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    -- lazygit stuff
    ["<leader>gg"] = { "<cmd> LazyGit<CR> "},

    -- Keep clipboard register while pasting
    ["<leader>p"] = { "\"_dP" },

    -- move by page while centering cursor
    ["<C-d>"] = { "<C-d>zz", "go down half page" },
    ["<C-u>"] = { "<C-u>zz", "go up half page" },

     -- move a line up/down
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "move line down" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "move line up" },
  },
  i = {
     -- move a line up/down
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "  imove line down" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "  imove line up" },
  }
}

return M

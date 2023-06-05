local M = {}

M.mason = {
  ensure_installed = {
     -- lua stuff
    "lua-language-server",
    "stylua",

    -- other stuff
    "bash-language-server",
    "eslint-lsp",
    "pylint",
    "rust-analyzer",
    "gopls",
    "markdownlint",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
  }
}

M.treesitter = {
  ensure_installed = {
    "cpp",
    "dockerfile",
    "vim",
    "lua",
    "html",
    "css",
    "go",
    "javascript",
    "typescript",
    "tsx",
    "rust",
    "markdown",
  },
  indent = {
    enable = true,
  }
}

-- git support in nvimtree
M.nvimtree = {
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      }
    }
  }
}

M.telescope = {
  extensions = {"media_files"}
}

return M

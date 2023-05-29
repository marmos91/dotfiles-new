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
    "vale"
  }
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "rust",
    "markdown",
    "markdown_inline"
  },
  indent = {
    enable = true,
  }
}

-- git support in nvimtree
M.nvimtree = {
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

return M

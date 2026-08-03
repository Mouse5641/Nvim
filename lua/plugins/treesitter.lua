return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({})

      local parsers = {
        "python",
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
      }
      require("nvim-treesitter").install(parsers)

      local filetypes = {
        "python",
        "lua",
        "vim",
        "help",
        "sh",
        "json",
        "yaml",
        "toml",
        "markdown",
        "javascript",
        "typescript",
        "typescriptreact",
        "html",
        "css",
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
          vim.wo[0][0].foldmethod = "expr"
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
      })
      vim.opt.foldlevel = 99
    end,
  },
}

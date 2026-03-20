return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup({
        highlight = {
          enable = true
        },
        ensure_installed = {
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
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldlevel = 99
    end,
  },
}

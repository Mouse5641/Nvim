return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("kanagawa").setup({
        undercurl = true,
        dimInactive = true,
        terminalColors = true,

      })
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
}


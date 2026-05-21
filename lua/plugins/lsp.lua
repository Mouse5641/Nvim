return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "texlab" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      vim.lsp.config('pyright', {
        capabilities = capabilities,
      })
      vim.lsp.enable('pyright')
    
      vim.lsp.config('texlab', {
        capabilities = capabilities,
      })
      vim.lsp.enable('texlab')

    end,
  },
}

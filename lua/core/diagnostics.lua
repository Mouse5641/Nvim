local icons = {
  [vim.diagnostic.severity.ERROR] = "",
  [vim.diagnostic.severity.WARN] = "",
  [vim.diagnostic.severity.HINT] = "",
  [vim.diagnostic.severity.INFO] = "",
}

vim.diagnostic.config({
  signs = { text = icons },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    spacing = 5,
    source = "if_many",
    prefix = "●",
  },
  float = {
    border = "rounded",
    source = "always",
    focusable = false,
  },
})

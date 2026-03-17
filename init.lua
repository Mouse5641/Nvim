vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup("plugins")
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     config = function()
--       local ok, configs = pcall(require, "nvim-treesitter.configs")
--       if ok then
--         configs.setup({
--           highlight = { enable = true },
--           indent = { enable = true },
--         })
--       end
--     end,
--   },
-- })
require("core.keymaps")

-- увімкнути 24-bit кольори
vim.opt.termguicolors = true

-- нумерація
vim.opt.number = true
vim.opt.relativenumber = true

-- таби
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- пошук
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- мишка
vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

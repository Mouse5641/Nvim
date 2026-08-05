local keymap = vim.keymap.set
local opts = { silent = true }

vim.g.mapleader = " "

----------------------------------------------------------------
-- Neo-tree
----------------------------------------------------------------

keymap("n", "<leader>f", ":Neotree focus<CR>", opts)
keymap("n", "<leader>n", ":Neotree toggle<CR>")

----------
keymap("n", "<leader>g", ":Neotree git_status<CR>", opts)
keymap("n", "<leader>r", ":Neotree reveal<CR>", opts)
keymap("n", "<leader>o", function()
  vim.fn.jobstart({ "xdg-open", vim.fn.expand("%") }, { detach = true })
end, opts)
-------------

----------------------------------------------------------------
-- Tabs ??????????????????????????????
----------------------------------------------------------------

keymap("n", "<A-Right>", ":tabnext<CR>", opts)
keymap("n", "<A-Left>", ":tabprevious<CR>", opts)
keymap("n", "<A-t>", ":tabnew<CR>", opts)
keymap("n", "<A-c>", ":tabclose<CR>", opts)

----------------------------------------------------------------
-- Classic
----------------------------------------------------------------

-- space + i → open current file in system program
keymap("n", "<leader>i", function()
  vim.fn.jobstart({ "xdg-open", vim.fn.expand("%:p") }, { detach = true })
end, opts)
keymap("n", "<C-a>", "ggVG", opts)
keymap({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", opts)
keymap({ "n", "v" }, "<C-v>", '"+p', opts)

----------------------------------------------------------------
-- Diagnostics
----------------------------------------------------------------

-- ]d / [d → наступна/попередня діагностика (будь-якого рівня)
keymap("n", "]p", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)
keymap("n", "[p", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, opts)

-- ]e / [e → наступна/попередня саме помилка (ERROR)
keymap("n", "]o", function()
  vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })
end, opts)
keymap("n", "[o", function()
  vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR })
end, opts)

keymap("n", "<leader>p", vim.diagnostic.open_float, opts)
keymap("n", "<leader>o", vim.diagnostic.setqflist, opts)

-- leader + t → красивий список діагностик усього проєкту (trouble.nvim)
keymap("n", "<leader>t", "<cmd>Trouble diagnostics toggle<CR>", opts)

-- leader + T → той самий список, але тільки для поточного буфера
keymap("n", "<leader>T", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", opts)

----------------------------------------------------------------
-- Move text up/down (Alt + Up/Down)
----------------------------------------------------------------

keymap("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap("n", "<A-Down>", ":m .+1<CR>==", opts)

keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)





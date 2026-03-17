local keymap = vim.keymap.set
local opts = { silent = true }

vim.g.mapleader = " "

----------------------------------------------------------------
-- Neo-tree
----------------------------------------------------------------

keymap("n", "<leader>f", ":Neotree focus<CR>", opts)
keymap("n", "<leader>n", ":Neotree toggle<CR>", opts)
keymap("n", "<leader>g", ":Neotree git_status<CR>", opts)
keymap("n", "<leader>r", ":Neotree reveal<CR>", opts)
keymap("n", "o", function()
  vim.fn.jobstart({ "xdg-open", vim.fn.expand("%") }, { detach = true })
end, opts)

----------------------------------------------------------------
-- Tabs
----------------------------------------------------------------
keymap("n", "<A-Right>", ":tabnext<CR>", opts)
keymap("n", "<A-Left>", ":tabprevious<CR>", opts)
keymap("n", "<A-t>", ":tabnew<CR>", opts)
keymap("n", "<A-c>", ":tabclose<CR>", opts)

----------------------------------------------------------------
-- Classic
----------------------------------------------------------------
keymap("n", "<leader>i", function()
  vim.fn.jobstart({ "xdg-open", vim.fn.expand("%:p") }, { detach = true })
end, opts)
keymap("n", "<C-a>", "ggVG", opts)
keymap({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", opts)
keymap({ "n", "v" }, "<C-v>", '"+p', opts)

----------------------------------------------------------------
-- Move text up/down (Alt + Up/Down)
----------------------------------------------------------------
keymap("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap("n", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)


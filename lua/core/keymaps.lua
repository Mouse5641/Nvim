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
keymap("n", "o", function()
  vim.fn.jobstart({ "xdg-open", vim.fn.expand("%") }, { detach = true })
end, opts)
-------------

----------------------------------------------------------------
-- Tabs ??????????????????????????????
----------------------------------------------------------------

-- Alt + Right → next tab
keymap("n", "<A-Right>", ":tabnext<CR>", opts)

-- Alt + Left → previous tab
keymap("n", "<A-Left>", ":tabprevious<CR>", opts)

-- Alt + t → new tab
keymap("n", "<A-t>", ":tabnew<CR>", opts)

-- Alt + c → close tab
keymap("n", "<A-c>", ":tabclose<CR>", opts)

----------------------------------------------------------------
-- Classic
----------------------------------------------------------------

-- space + i → open current file in system program
keymap("n", "<leader>i", function()
  vim.fn.jobstart({ "xdg-open", vim.fn.expand("%:p") }, { detach = true })
end, opts)

-- Ctrl + a → select all
keymap("n", "<C-a>", "ggVG", opts)

-- Ctrl + s → save
keymap({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", opts)

-- Ctrl + v → paste from system clipboard
keymap({ "n", "v" }, "<C-v>", '"+p', opts)

----------------------------------------------------------------
-- Move text up/down (Alt + Up/Down)
----------------------------------------------------------------

-- Normal mode
keymap("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap("n", "<A-Down>", ":m .+1<CR>==", opts)

-- Visual mode
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)


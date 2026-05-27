local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better nav
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize
map("n", "<A-h>", "<C-w><", opts)
map("n", "<A-l>", "<C-w>>", opts)
map("n", "<A-j>", "<C-w>-", opts)
map("n", "<A-k>", "<C-w>+", opts)

-- No highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Better paste
map("v", "p", '"_dP', opts)

-- Save
map("n", "<C-s>", "<cmd>w<CR>", opts)

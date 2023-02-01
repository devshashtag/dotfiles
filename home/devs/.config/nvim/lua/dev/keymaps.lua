local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", default_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Switch buffer
keymap("n", "<S-l>", ":bnext<CR>", default_opts)
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move text up and down
keymap("v", "K", ":m .-2<CR>==", default_opts)
keymap("v", "J", ":m .+1<CR>==", default_opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", default_opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

-- Resizing panes
keymap("n", "<C-Up>", ":resize -2<CR>", default_opts)
keymap("n", "<C-Down>", ":resize +2<CR>", default_opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", default_opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", default_opts)

-- Quickly Edit/Exit
keymap("", "<leader>q", ":q<CR>", default_opts)
keymap("", "<leader>s", ":w<CR>", default_opts)
keymap("", "<leader>fs", ":w<CR>", default_opts)
keymap("", "<leader>w", ":w<CR>", default_opts)
keymap("", "<C-s>", ":w<CR>", default_opts)

-- visual movement
keymap("n", "j", "gj", default_opts)
keymap("n", "k", "gk", default_opts)

-- highlight last inserted text
keymap("n", "gV", "`[v`]", default_opts)

-- Use Q for formatting the current paragraph (or selection)
keymap("n", "Q", "gqap", default_opts)
keymap("v", "Q", "gq", default_opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- plugins
keymap("", "<leader>e", ":NvimTreeToggle<CR>", default_opts)


-- This file is for general-purpose key mapping.
-- If you want to specify a plugin, please go to lua/plugin/

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- This will force you use "count" instead of key-repeat.
-- If you don't want this restriction, just comment it out.
require("utils.discipline").patient()

-- Do things without affecting the registers
keymap("n", "x", '"_x')
keymap("n", "<leader>c", '"_c')
keymap("n", "<leader>C", '"_C')
keymap("v", "<leader>c", '"_c')
keymap("v", "<leader>C", '"_C')
keymap("n", "<leader>d", '"_d')
keymap("n", "<leader>D", '"_D')
keymap("v", "<leader>d", '"_d')
keymap("v", "<leader>D", '"_D')

-- Disable arrow key in normal
keymap("n", "<left>", "<Nop>", opts)
keymap("n", "<right>", "<Nop>", opts)
keymap("n", "<up>", "<Nop>", opts)
keymap("n", "<down>", "<Nop>", opts)

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Tab / Buffer
keymap("n", "<leader>te", "<cmd>tabedit<cr>")
keymap("n", "<leader>bq", "<cmd>bd<cr>")
keymap("n", "[b", "<cmd>bp<cr>")
keymap("n", "]b", "<cmd>bn<cr>")

-- Split window
keymap("n", "_", "<cmd>split<CR><C-w>j")
keymap("n", "|", "<cmd>vsplit<CR><C-w>l")
-- Move window
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
-- Resize window
keymap("n", "<C-w><left>", "<C-w><")
keymap("n", "<C-w><right>", "<C-w>>")
keymap("n", "<C-w><up>", "<C-w>+")
keymap("n", "<C-w><down>", "<C-w>-")

-- quit hl search
keymap("n", "<leader><Return>", "<cmd>nohlsearch<cr>", opts)

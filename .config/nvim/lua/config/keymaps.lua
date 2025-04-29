-- This file is for general-purpose key mapping.
-- If you want to specify a plugin, please go to lua/plugin/

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- This will force you use "count" instead of key-repeat.
-- If you don't want this restriction, just comment it out.
require("chxun.discipline").patient()

-- Register
keymap({ "n", "v" }, "<leader>c", '"_c')
keymap({ "n", "v" }, "<leader>C", '"_C')
keymap({ "n", "v" }, "<leader>d", '"_d')
keymap({ "n", "v" }, "<leader>D", '"_D')
keymap({ "n", "v" }, "<leader>y", '"+y')
keymap("n", "<leader>Y", '"+Y')
keymap("x", "<leader>p", '"_dP')
keymap("n", "x", '"_x')

-- Move things
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Disable arrow key in normal
keymap("n", "<left>", "<Nop>", opts)
keymap("n", "<right>", "<Nop>", opts)
keymap("n", "<up>", "<Nop>", opts)
keymap("n", "<down>", "<Nop>", opts)

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Better Indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Tab / Buffer / Window
keymap("n", "<leader>te", "<cmd>tabedit<cr>")
keymap("n", "<leader>bq", "<cmd>bd<cr>")
keymap("n", "[b", "<cmd>bp<cr>")
keymap("n", "]b", "<cmd>bn<cr>")
-- Split window
keymap("n", "_", "<cmd>split<cr><C-w>j")
keymap("n", "|", "<cmd>vsplit<cr><C-w>l")
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

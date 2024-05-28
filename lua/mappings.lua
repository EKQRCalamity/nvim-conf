
-- Telescope local setop
local builtin = require("telescope.builtin")

-- Telescope Find Files keybinds
vim.keymap.set('n', '<C-i>', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true })

-- Nvim Tree Toggle (CHANGE THIS I USE SHIFT+- WHICH RESULTS IN "_" ON MY LAYOUT)
vim.keymap.set({ "n", "v", "t", "s", "o", "l"}, "_", "<cmd>:NvimTreeToggle<CR>", { noremap = true })

-- Telescope Grep keybinds
vim.keymap.set('n', '<C-g>', builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<leader>lg', builtin.live_grep, { noremap = true })

-- Make it possible to exit with <Esc> from terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Toggle Line Number Mode (nu! for absolute, rnu! for relative, both for hybrid)
vim.keymap.set({"n", "c", "v", "s", "o", "l"}, "<M-i>", "<cmd>:set nu! rnu!<CR>", { noremap = true })
vim.keymap.set({"n", "c", "v", "s", "o", "l"}, "<M-r>", "<cmd>:set rnu!<CR>", { noremap = true })

-- Use Tab for cycling through buffers
vim.keymap.set({"n", "c"}, "<Tab>", "<cmd>:BufferLineCycleNext<CR>", { noremap = true })
vim.keymap.set({"n", "c"}, "<S-Tab>", "<cmd>:BufferLineCyclePrev<CR>", { noremap = true })

-- Make it possible to change buffer width/height more Easily
-- Vertical resizing
vim.keymap.set("n", "<leader>v>", "<cmd>vertical resize +10<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v<", "<cmd>vertical resize -10<CR>", { noremap = true, silent = true })

-- Horizontal resizing
vim.keymap.set("n", "<leader>h>", "<cmd>resize +10<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h<", "<cmd>resize -10<CR>", { noremap = true, silent = true })
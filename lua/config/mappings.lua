-- Go into normal mode from terminal with <Esc>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Use <M-i> (Alt/Option [Meta Key] + i) or <M-r> (Alt/Option [Meta Key] + r) to change to
-- absolute, relative or both for hybrid line display mode. (Hybrid is sick tho)
vim.keymap.set({"n", "c", "v", "s", "o", "l"}, "<M-i>", "<cmd>:set nu!<CR>", { noremap = true })
vim.keymap.set({"n", "c", "v", "s", "o", "l"}, "<M-r>", "<cmd>:set rnu!<CR>", { noremap = true })

-- Change buffer height using <leader> (usually space) + v + > or < for vertical resize +10 or -10
vim.keymap.set("n", "<leader>v>", "<cmd>vertical resize +10<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v<", "<cmd>vertical resize -10<CR>", { noremap = true, silent = true })

-- Change buffer width using <leader> (usually space) + h + > or < for horizontal resize +10 or -10
vim.keymap.set("n", "<leader>h>", "<cmd>resize +10<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h<", "<cmd>resize -10<CR>", { noremap = true, silent = true })

-- Switch directly to new buffer split when splitting the window
vim.api.nvim_set_keymap("n", "<C-w>s", "<C-w>s<cmd>wincmd w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w>v", "<C-w>v<cmd>wincmd w<CR>", { noremap = true, silent = true })

-- Use <Tab> or <Shift-Tab> for cycling forward and backward through open buffers (bufferline.nvim)
vim.keymap.set("n", "<Tab>", "<cmd>:BufferLineCycleNext<CR>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>:BufferLineCyclePrev<CR>", { noremap = true })

-- Set <_> (for me its Shift + -) as open/close nvimtree
vim.keymap.set({"n","v","s","o","l"}, "_", "<cmd>:NvimTreeToggle<CR>", { noremap = true })

-- Telescope local setop
local builtin = require("telescope.builtin")

-- Telescope Find Files keybinds
vim.keymap.set('n', '<C-i>', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true })

-- Telescope Grep keybinds
vim.keymap.set('n', '<C-g>', builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<leader>lg', builtin.live_grep, { noremap = true })

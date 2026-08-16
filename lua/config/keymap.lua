local map = vim.api.nvim_set_keymap
local o = { noremap = true, silent = true }

map("i", "jk", "<Esc>", { noremap = true })

-- buffer
map("n", "<leader>h", "<cmd>bprev<CR>", o)
map("n", "<leader>l", "<cmd>bnext<CR>", o)
map("n", "<leader>d", "<cmd>bd<CR>", o)

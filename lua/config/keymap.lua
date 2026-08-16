local map = vim.api.nvim_set_keymap

-- buffer
map("n", "<leader>h", "<cmd>bprev<CR>", { desc = "Buffer prev", silent = true })
map("n", "<leader>l", "<cmd>bnext<CR>", { desc = "Buffer next", silent = true })
map("n", "<leader>d", "<cmd>bd<CR>", { desc = "Delete buffer", silent = true })

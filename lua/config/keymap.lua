local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", opts)
-- Close buffer
map("n", "<leader>bd", "<Cmd>bdelete<CR>", opts)

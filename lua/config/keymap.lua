local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<C-h>", "<Cmd>BufferPrevious<CR>", opts) --Ctrl+jで前のBufferに移動
map("n", "<C-l>", "<Cmd>BufferNext<CR>", opts) --Ctrl+kで次のBufferに移動
-- Close buffer
map("n", "<leader>bd", "<Cmd>BufferClose<CR>", opts) --<leader>+b+dでBufferを削除

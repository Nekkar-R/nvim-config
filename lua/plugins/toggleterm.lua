return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true, -- デフォルト設定でロードする場合
  cmd = "ToggleTerm",
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
  opts = {
    size = 20,
    -- ターミナルを開くショートカット（ターミナルモード内でも有効にする設定）
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    -- 表示方向: 'vertical' | 'horizontal' | 'tab' | 'float'
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
}

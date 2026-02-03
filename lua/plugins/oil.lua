return {
  "stevearc/oil.nvim",
  --- アイコンを表示するための依存関係（オプション）
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      -- 基本的な設定（デフォルトで十分使えますが、必要に応じてここに追加）
      default_file_explorer = true,
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },

      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    })

    vim.keymap.set("n", "<leader>e", require("oil").toggle_float, { desc = "Toggle Oil Float" })
  end,
}

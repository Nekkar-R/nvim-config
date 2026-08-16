return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      float = {
        padding = 2,
        max_width = 120,
        max_height = 32,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    })

    vim.keymap.set("n", "<leader>e", require("oil").toggle_float, { desc = "Toggle Oil Float" })
  end,
}

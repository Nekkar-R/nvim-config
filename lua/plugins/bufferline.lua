return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        show_buffer_close_icons = false,
        show_close_icon = false,
      },

      highlights = {
        buffer_selected = {
          fg = "#c0c0c0",
          bold = false,
          italic = false,
        },
      }
    })
  end,
}

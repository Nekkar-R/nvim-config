return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        -- 画像のような「丸い角」のスタイル
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          left_arrow = "─",
        },
        style = {
          { fg = "#838aa6" }, -- 画像のような紫系の色（ここを変えると線の色が変わります）
        },
        -- アニメーション設定（重く感じる場合は0にしてください）
        duration = 200,
        delay = 0,
      },
    })
  end
}

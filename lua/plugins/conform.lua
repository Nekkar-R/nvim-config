return {
"stevearc/conform.nvim",
event = { "BufReadPre", "BufNewFile" },
config = function()
  require("conform").setup({
    -- 言語ごとのフォーマッター設定
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      python = { "isort", "black" },
      -- その他のファイルタイプはLSP（言語サーバー）に任せる
      ["_"] = { "trim_whitespace" },
    },
    -- 保存時の自動フォーマット設定
    format_on_save = {
      lsp_fallback = true, -- フォーマッターがない場合はLSPを使う
      async = false,
      timeout_ms = 500,    -- タイムアウト設定
    },
  })
end,
}

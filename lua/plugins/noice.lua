return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    -- 依存プラグイン
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      -- LSP関連のUIをNoiceに任せる設定
      lsp = {
        -- override: 既存のLSP機能をNoiceのUIで上書きするかどうか
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- cmpのドキュメント表示もNoiceに任せる
        },
      },
      -- プリセット設定（おすすめの設定パック）
      presets = {
        bottom_search = true,         -- 検索(/)時はコマンドラインを下に表示（慣れている人向け）
        command_palette = true,       -- コマンド(:)時は画面中央にパレットを表示
        long_message_to_split = true, -- 長いメッセージは自動的に分割ウィンドウで表示
        inc_rename = false,           -- インクリメンタルリネーム（別途プラグインが必要なので一旦false）
        lsp_doc_border = false,       -- ドキュメントの枠線（好みに応じて）
      },
    })
  end,
}

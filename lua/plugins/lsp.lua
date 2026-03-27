return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- 1. Masonの初期化
    require("mason").setup()

    -- 2. 使いたいLSPサーバー
    local servers = { "lua_ls", "ts_ls", "pyright" }

    -- 3. Masonで自動インストール
    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })

    -- 4. cmp連携のためのCapabilityを取得
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- 5. 【修正箇所】Neovim 0.11+ の新APIに対応したセットアップ
    for _, server in ipairs(servers) do
      if vim.lsp.config then
        -- 新しい仕様 (Neovim 0.11+ / nvim-lspconfig v3.0.0対応)
        local config = vim.lsp.config[server] or {}
        config.capabilities = capabilities
        vim.lsp.config[server] = config
        vim.lsp.enable(server)
      else
        -- 従来の仕様 (Neovim 0.10以下)
        require("lspconfig")[server].setup({
          capabilities = capabilities,
        })
      end
    end

    -- 6. キーバインド設定
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })
  end,
}

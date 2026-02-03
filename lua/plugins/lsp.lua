return {
	-- 1. Mason関連 (外部ツールのインストーラー)
	{
		"williamboman/mason.nvim",
		cmd = "Mason", -- :Mason コマンドで起動
		build = ":MasonUpdate",
		opts = {}, -- デフォルト設定で有効化
	},

	-- 2. LSP設定 (Neovimと言語サーバーの接続)
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim", -- MasonとLSPConfigの接着剤
			"hrsh7th/cmp-nvim-lsp", -- 補完ソースとしてLSPを使う
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = {
					prefix = "|",
					source = "if_many",
					spacing = 4,
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			-- 補完プラグイン(cmp)がLSPの機能を使えるように設定をマージする
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			mason_lspconfig.setup({
				-- ここに自動インストールしたいサーバーを列挙できます
				ensure_installed = { "lua_ls" },

				-- インストールされたサーバーを自動でセットアップする設定
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities, -- 必須: これがないと補完候補が出ない
						})
					end,
				},
			})
		end,
	},

	-- 3. 補完機能 (nvim-cmp)
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter", -- 入力モードに入ったときに読み込む（高速化）
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSPソース
			"L3MON4D3/LuaSnip", -- スニペットエンジン
			"saadparwaiz1/cmp_luasnip", -- スニペットソース
			"hrsh7th/cmp-buffer", -- バッファ内単語ソース
			"hrsh7th/cmp-path", -- パスソース
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				-- キーマッピング
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							-- 補完ウィンドウが出ているときは、次の候補へ
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						elseif luasnip.expand_or_jumpable() then
							-- スニペットのプレースホルダーがあるときは、次へジャンプ
							luasnip.expand_or_jump()
						else
							-- それ以外は通常のTab入力（インデントなど）
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							-- 補完ウィンドウが出ているときは、前の候補へ
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						elseif luasnip.jumpable(-1) then
							-- スニペットのプレースホルダーがあるときは、前へジャンプ
							luasnip.jump(-1)
						else
							-- それ以外は通常のShift+Tab
							fallback()
						end
					end, { "i", "s" }),
				}),
				-- 補完ソースの優先順位
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP (最優先)
					{ name = "luasnip" }, -- スニペット
					{ name = "buffer" }, -- バッファ内の単語
					{ name = "path" }, -- ファイルパス
				}),
			})
		end,
	},
}

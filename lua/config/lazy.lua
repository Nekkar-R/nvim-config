-- 基本設定.
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt["clipboard"] = "unnamedplus"

vim.g.mapleader = " "

-- Lazy.vimの読み込み.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- pluginの読み込み.
require("lazy").setup({
	spec = {
		-- 全部セット.
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },

		-- 見た目系.
		-- { import = "plugins.catppuccin" }, -- catppuccin themes.
		{ import = "plugins.tawny" }, -- tawny themes.
		{ import = "plugins.toggleterm" }, -- ポップアップウィンドウ的な.

		-- 補完系.
		{ import = "plugins.surround" }, -- 色々括弧とかをいじれるやつ.

		-- 便利系.
		{ import = "plugins.oil" }, -- ファイルビューア.
		-- お遊び.
		-- { import = "plugins.hellshake-yano" }, -- 移動が楽になるやつ.
		{ import = "plugins.cord-nvim" }, -- Discordにいじってるファイル出るやつ.
		{ import = "plugins.render-markdown" }, -- markdownの編集がやりやすくなるやつ.
		-- { import = "plugins.youtuvim" }, -- neovim上でYoutubeが再生できる 尚音ズレと多分win非対応 完全にネタ yt-dlp, ffmpeg, python必要.
	},
})

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
		-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },

		{ import = "plugins.oil" },
		{ import = "plugins.themes" },
		{ import = "plugins.toggleterm" },
		{ import = "plugins.lsp" },
		{ import = "plugins.noice" },
		{ import = "plugins.bufferline" },
		{ import = "plugins.alpha-nvim" },
		{ import = "plugins.telescope" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.autopairs" },
		{ import = "plugins.lualine" },
		{ import = "plugins.bufferline" },
		{ import = "plugins.lazygit" },
		{ import = "plugins.conform" },
		{ import = "plugins.surround" },
		{ import = "plugins.hellshake-yano" },
	},
})

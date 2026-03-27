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
      { out,                            "WarningMsg" },
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
    { "LazyVim/LazyVim",                 import = "lazyvim.plugins" },

    -- 見た目系.
    { import = "plugins.themes" }, -- themes.
    -- { import = "plugins.noice" }, -- 通知リッチにするやつ.
    -- { import = "plugins.alpha-nvim" }, -- 起動したときに出るやーつ.
    -- { import = "plugins.lualine" }, -- 下に出てくるかっこいいやつ.
    -- { import = "plugins.bufferline" }, -- buffer表示するやーつ.
    -- { import = "plugins.hlchunk" }, -- インデント見やすくするやつ.
    -- { import = "plugins.toggleterm" }, -- ポップアップウィンドウ的な.

    -- 補完系.
    -- { import = "plugins.lsp" }, -- lsp関連のやつ 調整中 誰か助けて().
    -- { import = "plugins.cmp" }, -- cmp 要するに補完.
    -- { import = "plugins.autopairs" }, -- 括弧とかの補完.
    -- { import = "plugins.surround" }, -- 色々括弧とかをいじれるやつ.
    -- { import = "plugins.ts-autotag" }, -- タグを補完してくれるやつ.

    -- 便利系.
    { import = "plugins.oil" }, -- ファイルビューア.
    -- { import = "plugins.telescope" }, -- ファイル検索.
    -- { import = "plugins.treesitter" }, -- コードハイライト.
    -- { import = "plugins.lazygit" }, -- lazygitのやーつ.
    -- { import = "plugins.conform" }, -- コード綺麗にしてくれるやつ.
    -- { import = "plugins.which_key" }, -- 右下に出てくるショートカットのヒント.

    -- お遊び.
    { import = "plugins.hellshake-yano" },  -- 移動が楽になるやつ.
    { import = "plugins.cord-nvim" },       -- Discordにいじってるファイル出るやつ.
    { import = "plugins.render-markdown" }, -- markdownの編集がやりやすくなるやつ.
  },
})

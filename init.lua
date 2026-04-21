vim.loader.enable()

require("config.lazy")
require("config.keymap")

-- 内部文字コード
vim.opt.encoding = "utf-8"
-- 新規ファイルの文字コード
vim.opt.fileencoding = "utf-8"
-- 自動判別する文字コードの優先順位
vim.opt.fileencodings = { "utf-8", "cp932", "euc-jp", "iso-2022-jp" }
-- 改行コードの自動判別
vim.opt.fileformats = { "unix", "dos", "mac" }

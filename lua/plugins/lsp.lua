vim.o.pumborder = "rounded"

-- 将来的に設定が整備されたら不要.
local orig_complete_set = vim.api.nvim__complete_set
vim.api.nvim__complete_set = function(...)
  local result = orig_complete_set(...)
  if result and result.winid then
    pcall(vim.api.nvim_win_set_config, result.winid, { border = "rounded" })
  end
  return result
end

-- quoted from https://github.com/watasuke102/dotfiles/blob/31cc30cb604493d14c5f086d8dd252504c0e2dcf/.config/nvim/lua/plugins/lsp.lua
-- based `:h lsp-attach`
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- completion
    if client:supports_method("textDocument/completion") then
      local chars = {}
      for i = 32, 126 do
        table.insert(chars, string.char(i))
      end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true,
      })
    end
    -- auto formatting
    if
        not client:supports_method("textDocument/willSaveWaitUntil")
        and client:supports_method("textDocument/formatting")
    then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({
            bufnr = args.buf,
            id = client.id,
            timeout_ms = 3000,
          })
        end,
      })
    end
  end,
})

return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
    config = true,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim" },
      { "neovim/nvim-lspconfig" },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    keys = {
      { "<C-space>", "<cmd>lua vim.lsp.completion.get()  <CR>", mode = "i" },
      { "gh",        "<cmd>lua vim.lsp.buf.hover()       <CR>" },
      { "gd",        "<cmd>lua vim.lsp.buf.definition()  <CR>" },
      { "gD",        "<cmd>lua vim.lsp.buf.declaration() <CR>" },
    },
  },
}

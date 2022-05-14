local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "wc.lsp.configs"
require("wc.lsp.handlers").setup()

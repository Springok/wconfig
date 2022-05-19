local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
  sources = {
    diagnostics.rubocop.with({ -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/270
      command = "bundle",
      args = vim.list_extend({ "exec", "rubocop" }, diagnostics.rubocop._opts.args)}),
    diagnostics.clj_kondo,
    formatting.rubocop,
    formatting.cljstyle,
    completion.spell,
    diagnostics.trail_space
  },
})

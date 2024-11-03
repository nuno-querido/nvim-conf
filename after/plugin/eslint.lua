vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Eslint", {}),
  pattern = { "*.tsx", "*ts", "*.jsx", "*.js" },
  command = "EslintFixAll"
})

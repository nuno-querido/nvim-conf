require("typescript").setup({
  disable_commands = true,
  debug = false,
  go_to_source_definition = {
    fallback = true,
  },
  eslint_opts = {
    cwd = function(params)
      return require("lspconfig.util").root_patter("tsconfig.json")(params.buffname)
    end
  },
  server = {
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = (function()
      return vim.loop.cwd()
    end),
    on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<F24>", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)

      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = vim.lsp.buf.format
        })
      end
    end
  }
})

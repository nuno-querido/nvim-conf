require("config.set")
require("config.remap")
require("config.lazy")

local augroup = vim.api.nvim_create_augroup
local AirtikGroup = augroup('AirtikAugroup', {})
local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = AirtikGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set(
            "n",
            "K",
            function()
                vim.lsp.buf.hover({ border = "rounded" })
            end,
            opts
        )
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set(
            "n",
            "gn",
            function()
                vim.diagnostic.jump({ float = true, count = 1 })
            end,
            opts
        )
        vim.keymap.set(
            "n",
            "gp",
            function()
                vim.diagnostic.jump({ float = true, count = -1 })
            end,
            opts
        )
        vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<F3>", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("querido.set")
require("querido.remap")
require("querido.lazy_setup")

local augroup = vim.api.nvim_create_augroup
local QueridoGroup = augroup('Querido', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})


autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})


autocmd('LspAttach', {
    group = QueridoGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
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


autocmd("BufWritePre", {
    group = QueridoGroup,
    pattern = { "*.tsx", "*ts", "*.jsx", "*.js" },
    command = "EslintFixAll"
})


-- open NvimTree by default upon startup
if vim.fn.argc(-1) == 0 then
    vim.cmd("NvimTreeOpen")
end


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

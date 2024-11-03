
require("zen-mode").setup {
    window = {
        width = 130,
        options = {
            number = true,
            relativenumber = true,
        },
    },
    plugins = {
        diagnostics = { enabled = true },
    }
}

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle()
    require("lualine").setup()
    vim.wo.wrap = false
    -- ColorMyPencils()
end)


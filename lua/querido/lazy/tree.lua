return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = "25%",
            },
            update_focused_file = {
                enable = true,
            },
            diagnostics = {
                enable = true,
            },
        })
    end,
}

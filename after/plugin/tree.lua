function NTSetup()
    require("nvim-tree").setup {
        view = {
            width = "25%",
        },
        update_focused_file = {
            enable = true,
        },
        diagnostics = {
            enable = true,
        }
    }
    require("nvim-tree").open()
end

NTSetup()

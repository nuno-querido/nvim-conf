local is_undo_open = false;

return {
    "mbbill/undotree",

    config = function()
        -- for some off reason nvim tree has a 25% width but it's still wider than this...
        vim.g.undotree_SplitWidth = "40%"
        vim.keymap.set(
            "n",
            "<leader>u",
            function()
                local tree = require("nvim-tree.api").tree

                -- too lazy to find the correct way to invert a boolean value in lua :)
                is_undo_open = is_undo_open == false;
                vim.cmd.UndotreeToggle()

                if tree.is_visible() == is_undo_open then
                    tree.toggle({ focus = false })
                end
            end
        )
    end
}

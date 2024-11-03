function ColorMyPencils(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {},
        config = function()
            ColorMyPencils()
        end,
    },


    {
        "folke/tokyonight.nvim",
        config = function()
            require('tokyonight').setup({
                transparent = true,
                terminal_colors = true,
                styles = {
                  comments = { italic = false, fg = 'SeaGreen' },
                  keywords = { italic = false },
                  sidebars = "transparent",
                  -- floats = "transparent",
                },
                sidebars = { "packer", "qf", "vinta_kind", "terminal" },
                dim_inactive = true,
                lualine_bold = true,
            })

            ColorMyPencils()
        end
    },

}

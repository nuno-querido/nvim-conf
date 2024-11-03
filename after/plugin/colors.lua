--[[
function ColorMyPencils()
  local c = require('vscode.colors')
  require('vscode').setup({
    -- Enable transparent background
    transparent = true,
    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {},
    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
      -- this supports the same val table as vim.api.nvim_set_hl
      -- use colors from this colorscheme by requiring vscode.colors!
      Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
      TelescopeNormal = { bg = 'gray' },
    }
  })

  require('vscode').load()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- sets the background as transparent for floating windows like Mason one
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
]]--

function ColorMyPencils()
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

  vim.cmd.colorscheme("tokyonight-night")
end

ColorMyPencils()

return {
	"nvim-telescope/telescope.nvim",

	tag = "v0.2.2",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},

	config = function()
		local telescope_trouble_action = require("trouble.sources.telescope")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<c-t>"] = telescope_trouble_action.open,
						["<c-a>"] = telescope_trouble_action.add,
					},
					n = {
						["<c-t>"] = telescope_trouble_action.open,
						["<c-a>"] = telescope_trouble_action.add,
					},
				},

				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					horizontal = {
						preview_width = 0.6,
					},
					vertical = {
						width = 0.5,
					},
				},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

		vim.keymap.set("n", "<C-p>", builtin.git_files, {})

		vim.keymap.set("n", "<leader>ps", function()
			builtin.live_grep({ layout_strategy = "vertical" })
		end)

		vim.keymap.set("n", "<C-s>", function()
			builtin.treesitter({ layout_strategy = "vertical" })
		end)

		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)

		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)

		vim.keymap.set("n", "<leader>l", builtin.git_bcommits, {})
		vim.keymap.set("n", "<leader>gl", builtin.git_commits, {})
	end,
}

return {
	---@module 'snacks'
	"folke/snacks.nvim",
	opts = {
		bigfile = { enabled = true },
		scroll = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
	},
}

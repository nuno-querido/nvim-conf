return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>dg",
			"<cmd>Trouble diagnostics toggle focus=true<cr>",
			desc = "Diagnostics",
		},
		{
			"<leader>ti",
			"<cmd>Trouble lsp_incoming_calls toggle win.position=right<cr>",
			desc = "Incoming Calls",
		},
	},
}

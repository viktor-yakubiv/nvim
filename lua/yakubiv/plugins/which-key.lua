return {
	"folke/which-key.nvim",
	name = "which-key",
	event = "VeryLazy",
	init = function()
		vim.opt.timeout = true
		vim.opt.timeoutlen = 750
	end,
	opts = {
		window = {
			border = "single",
		},
	},
}

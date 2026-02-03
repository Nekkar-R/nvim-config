return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,

	build = ":CatppuccinCompile",

	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			transparent_background = true,

			compile = {
				enabled = true,
				path = vim.fn.stdpath("cache") .. "/catppuccin",
				suffix = "_compiled",
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}

return {
	"r-happy/tawny.nvim",
	priority = 1000,
	config = function()
		require("tawny").setup({
			transparent = true,
		})
		vim.cmd("colorscheme tawny")
	end,
}

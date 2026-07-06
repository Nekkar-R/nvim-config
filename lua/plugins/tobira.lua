return {
	"kamegoro/tobira.nvim",
	event = "VeryLazy",
	opts = {},

	config = function()
		require("tobira").setup({
			lang = "ja",
		})
	end,
}

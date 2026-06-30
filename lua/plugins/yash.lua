return {
	"kihachi2000/yash.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.cmd("colorscheme yash")

		-- 背景を透過させる
		local groups = {
			"Normal",
			"NormalNC",
			"NormalFloat",
			"SignColumn",
			"EndOfBuffer",
			"LineNr",
			"FoldColumn",
			"MsgArea",
			"WinBar",
			"WinBarNC",
		}
		for _, group in ipairs(groups) do
			vim.api.nvim_set_hl(0, group, { bg = "none" })
		end
	end,
}

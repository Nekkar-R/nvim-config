return {
	"lervag/vimtex",
	ft = "tex",
	config = function()
		local g = vim.g
		g.vimtex_compiler_method = "latexmk"
		g.vimtex_compiler_latexmk = {
			out_dir = "out",
		}
	end,
}

return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },

	"tpope/vim-sleuth",

	"nathom/filetype.nvim",
	"nvim-lua/popup.nvim",
}

-- vim: ts=2 sts=2 sw=2 et

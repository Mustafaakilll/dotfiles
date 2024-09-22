return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("tokyonight-night")
			vim.cmd.hi("Comment gui=none")
		end,
	},
	"rktjmp/lush.nvim",
	"craftzdog/solarized-osaka.nvim",
	{ "rose-pine/neovim", name = "rose-pine" },
	"eldritch-theme/eldritch.nvim",
	"jesseleite/nvim-noirbuddy",
	"miikanissi/modus-themes.nvim",
	"rebelot/kanagawa.nvim",
	"gremble0/yellowbeans.nvim",
	"folke/tokyonight.nvim",
	"Shatur/neovim-ayu",
	"xero/miasma.nvim",
	"cocopon/iceberg.vim",
	"kepano/flexoki-neovim",
	{ "catppuccin/nvim", name = "catppuccin" },
	"uloco/bluloco.nvim",
	"LuRsT/austere.vim",
	"NTBBloodbath/sweetie.nvim",
	"maxmx03/fluoromachine.nvim",
}

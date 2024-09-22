return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "A" },
			change = { text = "C" },
			delete = { text = "D" },
			topdelete = { text = "TD" },
			changedelete = { text = "CD" },
		},

		numhl = true,
		signcolumn = true,
		linehl = false,
		word_diff = false,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
			ignore_whitespace = false,
		},
	},
}

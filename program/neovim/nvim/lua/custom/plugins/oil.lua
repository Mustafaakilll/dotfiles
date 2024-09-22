return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			use_default_keymaps = false,
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<C-s>"] = "actions.select_vsplit",
				["P"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["R"] = "actions.refresh",
				["-"] = "actions.parent",
				["<C-h>"] = "actions.parent",
				["<C-l>"] = "actions.select",
			},
		})
	end,
}

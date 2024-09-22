---@diagnostic disable: undefined-field
return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					numbers = function(opts)
						local harpoon = require("harpoon.mark")
						local buf_name = vim.api.nvim_buf_get_name(opts.id)
						local harpoon_mark = harpoon.get_index_of(buf_name)
						return harpoon_mark
					end,
					left_trunc_marker = "",
					right_trunc_marker = "",
					name_formatter = function(buf)
						return vim.fn.fnamemodify(buf.name, ":t:r")
					end,
					diagnostics = "nvim_lsp",
					color_icons = true,
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = false,
					show_tab_indicators = true,
					persist_buffer_sort = true,
					separator_style = "thick", -- "thick", "thin"
					enforce_regular_tabs = false,
					always_show_bufferline = true,
				},
			})
		end,
	},
	{
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup({})
		end,
	},
}

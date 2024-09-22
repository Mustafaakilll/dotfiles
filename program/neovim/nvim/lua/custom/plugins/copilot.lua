return {
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				panel = { enabled = true },
				suggestion = { enabled = false },
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				suggestion = {
					enabled = true,
				},
				panel = {
					enabled = true,
				},
			})
		end,
	},
}

return {
	"elixir-tools/elixir-tools.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local elixir = require("elixir")
		local elixirls = require("elixir.elixirls")

		elixir.setup({
			-- nextls = { enable = true },
			credo = { enable = false },
			elixirls = {
				enable = true,
				settings = elixirls.settings({
					dialyzerEnabled = false,
					enableTestLenses = false,
				}),
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
					vim.keymap.set("n", "<leader>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
					vim.keymap.set("v", "<leader>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })

					-- require("plugins.config.lsp-config").on_attach(client, bufnr)
				end,
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

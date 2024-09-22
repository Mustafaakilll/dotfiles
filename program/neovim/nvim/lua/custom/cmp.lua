vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
lspkind.init({
	symbol_map = {
		Copilot = "",
	},
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
			show_labelDetails = true,
		}),
	},
	-- formatting = {
	-- 	format = function(entry, vim_item)
	-- 		vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
	-- 		vim_item.menu = ({
	-- 			nvim_lsp = "[LSP]",
	-- 			lazydev = "[LazyDev]",
	-- 			copilot = "[Copilot]",
	-- 			path = "[Path]",
	-- 			buffer = "[Buffer]",
	-- 			fish = "[Fish]",
	-- 		})[entry.source.name]
	-- 		return vim_item
	-- 	end,
	-- },
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	completion = { completeopt = "menu,menuone,noinsert" },

	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),

		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		["<C-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),

		["<C-Space>"] = cmp.mapping.complete({}),

		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "copilot" },
		{
			name = "lazydev",
			group_index = 0,
		},
		{ name = "fish", option = { fish_path = "/home/mustafaakilll/.nix-profile/bin/fish" } },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
})

cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "vim-dadbod-completion" },
		{ name = "buffer" },
	},
})

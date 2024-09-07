require("nvim-treesitter.configs").setup({
	ensure_installed = { "dart", "go", "rust", "javascript", "typescript", "lua", "sql", "yaml" },
	indent = { enable = true },
	highlight = { enable = true, use_languagetree = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,

			keymaps = {
				["of"] = "@function.outer",
				["if"] = "@function.inner",
				["oc"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			include_surrounding_whitespace = true,
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
	refactor = {
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		highlight_current_scope = { enable = true },
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		},
	},
	pairs = {
		enable = true,
		disable = {},
		highlight_pair_events = {},
		highlight_self = false,
		goto_right_end = false,
		fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')",
		delete_balanced = {
			only_on_first_char = false,
			fallback_cmd_normal = nil,
			longest_partner = false,
		},
	},

	playground = { enable = true },
})

require("treesitter-context").setup({
	enable = true,
	max_lines = 0,
	min_window_height = 0,
	line_numbers = true,
	multiline_threshold = 20,
	trim_scope = "outer",
	mode = "cursor",
	separator = nil,
	zindex = 20,
})

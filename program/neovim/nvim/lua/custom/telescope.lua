local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-x>"] = actions.delete_buffer,
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<A-p>"] = action_layout.toggle_preview,
				["<A-m>"] = action_layout.toggle_mirror,
				["<C-k>"] = actions.cycle_history_next,
				["<C-j>"] = actions.cycle_history_prev,
				["<c-g>s"] = actions.select_all,
				["<c-g>a"] = actions.add_selection,
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},

		git_branches = {
			mappings = {
				i = {
					["<C-a>"] = false,
				},
			},
		},

		buffers = {
			sort_lastused = true,
			ignore_current_buffer = true,
			sort_mru = true,
		},
	},
	extensions = {
		wrap_result = true,
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

pcall(require("telescope").load_extension, "file_browser")
pcall(require("telescope").load_extension, "ui-select")
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>fd", builtin.find_files, { desc = "[F]ind [F]iles" })
map("n", "<leader>gw", builtin.grep_string, { desc = "[G]rep [W]ord" })
map("n", "<leader>gl", builtin.live_grep, { desc = "[G]rep [L]ive" })
map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })

map("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "Buffer Fuzzy Find" })
map("n", "<leader>dd", builtin.diagnostics, { desc = "[D][D]iagnostics" })

map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

map("n", "<leader>gs", builtin.git_stash, { desc = "[G]it [S]tatus" })
map("n", "<leader>gc", builtin.git_commits)

map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

map("n", "<leader>cf", function()
	builtin.find_files({ cwd = "~/.config/home-manager/program/neovim/nvim/" })
end, { desc = "[C]onfig [F]iles" })

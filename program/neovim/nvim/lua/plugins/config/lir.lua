local clipboard_actions = require("lir.clipboard.actions")
local has_lir, lir = pcall(require, "lir")
if not has_lir then
	return
end

local has_devicons, devicons = pcall(require, "nvim-web-devicons")
if has_devicons then
	devicons.setup({
		override = {
			lir_folder_icon = {
				icon = "",
				color = "#7ebae4",
				name = "LirFolderNode",
			},
		},
	})
end

local actions = require("lir.actions")
local has_mmv, mmv_actions = pcall(require, "lir.mmv.actions")

lir.setup({
	hide_cursor = false,
	ignore = { "node_modules", ".DS_Store", ".idea" },
	show_hidden_files = true,
	devicons = {
		highlight_dirname = true,
		enable = true,
	},

	float = {
		win_opts = function()
			local width = math.floor(vim.o.columns * 0.8)
			local height = math.floor(vim.o.lines * 0.8)
			return {
				border = {
					"+",
					"─",
					"+",
					"│",
					"+",
					"─",
					"+",
					"│",
				},
				width = width,
				height = height,
				row = 1,
				col = math.floor((vim.o.columns - width) / 2),
			}
		end,
		winblend = 15,
		curdir_window = {
			enable = false,
			highlight_dirname = false,
		},
	},

	mappings = {
		["l"] = actions.edit,
		["h"] = actions.up,

		["A"] = actions.mkdir,
		["a"] = actions.newfile,

		["R"] = actions.rename,
		["Y"] = actions.yank_path,
		["D"] = actions.delete,
		["H"] = actions.toggle_show_hidden,

		["<C-s>"] = actions.split,
		["<C-v>"] = actions.vsplit,

		["C"] = clipboard_actions.copy,
		["X"] = clipboard_actions.cut,
		["P"] = clipboard_actions.paste,
		-- mmv
		["M"] = (has_mmv and mmv_actions.mmv) or nil,
	},
})

require("lir.git_status").setup({
	show_ignored = false,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lir" },
	callback = function()
		-- use visual mode
		vim.api.nvim_buf_set_keymap(
			0,
			"x",
			"J",
			':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
			{ noremap = true, silent = true }
		)
		-- echo cwd
		vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
	end,
})

vim.api.nvim_set_keymap("n", "-", ":edit %:h<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":lua require('lir.float').toggle()<CR>", { noremap = true })

vim.cmd([[ highlight link LirGitStatusBracket Comment ]])
vim.cmd([[ highlight link LirGitStatusIndex Special ]])
vim.cmd([[ highlight link LirGitStatusWorktree WarningMsg ]])
vim.cmd([[ highlight link LirGitStatusUnmerged ErrorMsg  ]])
vim.cmd([[ highlight link LirGitStatusUntracked Comment  ]])
vim.cmd([[ highlight link LirGitStatusIgnored Comment    ]])

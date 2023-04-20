if not pcall(require, "telescope") then
  return
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local action_layout = require "telescope.actions.layout"

require('telescope').setup({
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    multi_icon = "<>",
    selection_strategy = "reset",
    scroll_strategy = "cycle",
    color_devicons = true,
    sorting_strategy = "descending",
    winblend = 0,
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },

      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },

      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },
    mappings = {
      i = {
        ["<RightMouse>"] = actions.close,
        ["<LeftMouse>"] = actions.select_default,
        ["<ScrollWheelDown>"] = actions.move_selection_next,
        ["<ScrollWheelUp>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<M-p>"] = action_layout.toggle_preview,
        ["<M-m>"] = action_layout.toggle_mirror,
        -- This is nicer when used with smart-history plugin.
        ["<C-k>"] = actions.cycle_history_next,
        ["<C-j>"] = actions.cycle_history_prev,
        ["<c-g>s"] = actions.select_all,
        ["<c-g>a"] = actions.add_selection,
      },
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    history = {
      path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
      limit = 100,
    },
  },
  pickers = {
    find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },

      mappings = {
        n = {
          ["<C-q>"] = "close",
        },
     },
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
  extension = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },

    fzf_writer = {
      use_highlighter = false,
      minimum_grep_characters = 6,
    },

    hop = {
      keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }, -- ... and more
      sign_hl = { "WarningMsg", "Title" },
      line_hl = { "CursorLine", "Normal" },
      clear_selection_hl = false,
      trace_entry = true,
      reset_selection = true,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

require("telescope").load_extension "notify"
require("telescope").load_extension "file_browser"
require("telescope").load_extension "ui-select"
require("telescope").load_extension "fzf"
require("telescope").load_extension "git_worktree"
require("telescope").load_extension "neoclip"

if vim.fn.executable "gh" == 1 then
  pcall(require("telescope").load_extension, "gh")
  pcall(require("telescope").load_extension, "octo")
end

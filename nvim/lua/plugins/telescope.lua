local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    initial_mode = 'normal',
    prompt_prefix = " ",
    selection_caret = ' ',
    history = {
      path = "~/.local/share/nvim/telescope_history.sqlite3",
      limit = 100,
    },
    mappings = {
      i = {
        ["<A-p>"] = require("telescope.actions.layout").toggle_preview,
        ["<C-Down>"] = actions.cycle_history_next,
        ["<C-Up>"] = actions.cycle_history_prev,
        ["<F1>"] = actions.which_key,
      },
      n = {
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        ["<F1>"] = actions.which_key,
      },
    },
  },
  extensions = {
    frecency = { workspaces = { exo = '/home/mustafaakil/Documents/projects/full-stack/blog_app/frontend' } },
    file_browser = {
      grouped = true,
      previewer = false,
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
  },
  pickers = {
    lsp_references = { theme = 'dropdown' },
    lsp_code_actions = { theme = 'dropdown' },
    lsp_definitions = { theme = 'dropdown' },
    lsp_implementations = { theme = 'dropdown' },
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      previewer = false,
    },
  },
}

-- Extensions
telescope.load_extension 'frecency'
telescope.load_extension 'fzf'
telescope.load_extension 'ui-select'

require('telescope').load_extension('flutter')

local bar_bg = '#1f1f1f'
local bar_fg = '#c9c9c9'
local elem_bg = '#2d2d2d'
local elem_fg = '#8c8c8c'
local selected_bg = '#444444'
local selected_fg = '#efefef'
local error_fg = '#ca241a'
local warning_fg = '#fabd2f'
local info_fg = '#83a5cb'
local pick_fg = '#870000'

local colors = {
  bar = { fg = bar_fg, bg = bar_bg },
  elem = { fg = elem_fg, bg = elem_bg },
  elem_inactive = { fg = elem_fg, bg = elem_bg },
  elem_selected = { fg = selected_fg, bg = selected_bg },
  separator = { fg = bar_bg, bg = elem_bg },
  separator_selected = { fg = bar_bg, bg = selected_bg },
  error = { fg = error_fg, bg = elem_bg, sp = error_fg },
  error_selected = { fg = error_fg, bg = selected_bg, underline = true, undercurl = true, italic = true },
  warning = { fg = warning_fg, bg = elem_bg, sp = warning_fg },
  warning_selected = { fg = warning_fg, bg = selected_bg, underline = true, undercurl = true, italic = true },
  info = { fg = info_fg, bg = elem_bg, sp = info_fg },
  info_selected = { fg = info_fg, bg = selected_bg, underline = true, undercurl = true, italic = true },
  pick = { fg = pick_fg, bg = elem_bg },
  pick_selected = { fg = pick_fg, bg = selected_bg },
}

local diagnostics_signs = {
  ['error'] = '',
  warning = '',
  default = '',
}

require('bufferline').setup {
  highlights = {
    background = colors.elem_inactive,
    buffer_selected = colors.elem_selected,
    buffer_visible = colors.elem_inactive,
    close_button = colors.elem,
    close_button_selected = colors.elem_selected,
    close_button_visible = colors.elem,
    diagnostic = colors.info,
    diagnostic_selected = colors.info_selected,
    diagnostic_visible = colors.info,
    duplicate = colors.elem,
    duplicate_selected = colors.elem_selected,
    duplicate_visible = colors.elem,
    error = colors.error,
    error_diagnostic = colors.error,
    error_diagnostic_selected = colors.error_selected,
    error_selected = colors.error_selected,
    fill = colors.bar,
    hint = colors.info,
    hint_diagnostic = colors.info,
    hint_diagnostic_selected = colors.info_selected,
    hint_diagnostic_visible = colors.info,
    hint_selected = colors.info_selected,
    hint_visible = colors.info,
    info = colors.info,
    info_diagnostic = colors.info,
    info_diagnostic_selected = colors.info_selected,
    info_diagnostic_visible = colors.info,
    info_selected = colors.info_selected,
    info_visible = colors.info,
    modified = colors.elem,
    modified_selected = colors.elem_selected,
    modified_visible = colors.elem,
    pick = colors.pick,
    pick_selected = colors.pick_selected,
    separator = colors.separator,
    separator_selected = colors.separator_selected,
    separator_visible = colors.separator,
    tab = colors.elem,
    tab_close = colors.bar,
    tab_selected = colors.elem_selected,
    warning = colors.warning,
    warning_diagnostic = colors.warning,
    warning_diagnostic_selected = colors.warning_selected,
    warning_diagnostic_visible = colors.warning,
    warning_selected = colors.warning_selected,
    warning_visible = colors.warning,
  },
  options = {
    mode = "buffers",
    numbers = "buffer_id", -- | "none" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)
      return vim.fn.fnamemodify(buf.name, ':t:r')
    end,
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
      local s = ' '
      for e, n in pairs(diagnostics_dict) do
        local sym = diagnostics_signs[e] or diagnostics_signs.default
        s = s .. (#s > 1 and ' ' or '') .. sym .. ' ' .. n
      end
      return s
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
        return true
      end
      return false
    end,
    offsets = {
      {
        filetype = "NvimTree",
        -- text = "File Explorer" | function ,
        text_align = "center", -- | "left" | "right"
        separator = true
      }
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_buffer_default_icon = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin", --| "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    sort_by = 'insert_after_current',
      -- add custom logic
      -- return buffer_a.modified > buffer_b.modified
    -- end
}
  }

local wezterm = require 'wezterm'

local action = wezterm.action

local config = {}


if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on('update-right-status', function(window)
  local date = wezterm.strftime '%a %b %-d %H:%M'
  local bat = ''
  for _, b in ipairs(wezterm.battery_info()) do
    bat = string.format('%.0f%%', b.state_of_charge * 100)
  end

  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
    window:set_right_status(name or '')
  else
    window:set_right_status(wezterm.format {
      { Text = bat .. '   ' .. date },
    })
  end
end)

config.color_scheme = 'DoomOne'
-- config.color_scheme = 'Doom Peacock'
-- config.color_scheme = 'Apple Classic'
-- config.color_scheme = 'Aurora'
-- config.color_scheme = 'GruvboxDark'
-- config.color_scheme = 'BlulocoDark'
-- config.color_scheme = 'Breath (Gogh)'
-- config.color_scheme = 'Breath Darker (Gogh)'
-- config.color_scheme = 'Broadcast'
-- config.color_scheme = 'Calamity'
-- config.color_scheme = 'Catppuccin Macchiato'
-- config.color_scheme = 'DanQing (base16)'
-- config.color_scheme = 'Dracula (Official)'

-- config.use_fancy_tab_bar = false
config.font = wezterm.font('JetBrains Mono', { stretch = 'Expanded', style = 'Normal' })
config.font_shaper = 'Harfbuzz'
config.cell_width = 0.9
config.line_height = 1.0
config.enable_tab_bar = true
-- config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.tab_max_width = 16
config.window_frame = { font = wezterm.font { family = 'JetBrains Mono' }, font_size = 10 }
-- config.cursor_thickness = '0.1cell'
-- config.allow_square_glyphs_to_overflow_width = 'Never'
-- config.adjust_window_size_when_changing_font_size = false
config.alternate_buffer_wheel_scroll_speed = 3
config.audible_bell = 'SystemBeep'
config.bold_brightens_ansi_colors = 'No'
config.check_for_updates = true
-- config.cursor_blink_ease_in = 'Linear'
config.detect_password_input = true
config.enable_scroll_bar = true
config.enable_wayland = true
config.front_end = 'OpenGL'
config.hide_mouse_cursor_when_typing = true
config.integrated_title_buttons = {}
config.min_scroll_bar_height = '0.5cell'
config.pane_focus_follows_mouse = true
config.prefer_egl = true
config.tiling_desktop_environments = { 'i3', 'sway', 'Wayland' }
config.window_decorations = 'TITLE|RESIZE'
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- config.window_frame = {
--   inactive_titlebar_bg = '#353535',
--   active_titlebar_bg = '#2b2042',
--   inactive_titlebar_fg = '#cccccc',
--   active_titlebar_fg = '#ffffff',
--   inactive_titlebar_border_bottom = '#2b2042',
--   active_titlebar_border_bottom = '#2b2042',
--   button_fg = '#cccccc',
--   button_bg = '#2b2042',
--   button_hover_fg = '#ffffff',
--   button_hover_bg = '#3b3052',
-- }

-- config.tab_bar_style = {
--   new_tab = 'X',
--   window_close = '+'
-- }

config.window_background_image = '/home/mustafaakil/.local/share/wallpapers/36.jpg'
config.window_background_image_hsb = { saturation = 1.0, hue = 1 }
config.text_background_opacity = 0.6

--- Launch Menu
config.launch_menu = {
  { args = { 'htop' } },
  { label = 'Cargo watch', args = { 'cargo', 'watch', '-x', 'run' } },
  {
    label = 'Go Watch',
    args = { 'nodemon', '--watch', './**/*.go', '--signal', 'SIGTERM', '--exec', ' go', 'run', './.' }
  }
}

-- config.leader = { key = 'v', mods = 'ALT', timeout_milliseconds = 3000 }
config.keys = {
  { key = 'l', mods = 'ALT',        action = action.ShowLauncher },
  { key = '|', mods = 'CTRL|SHIFT', action = action.SplitHorizontal },
  -- { key = '-', mods = 'CTRL|SHIFT', action = action.SplitVertical },
  { key = 'r', mods = 'CTRL|SHIFT', action = action.ActivateKeyTable { name = 'resize_pane', one_shot = false, } },
  { key = '{', mods = 'CTRL|SHIFT', action = action.ActivateKeyTable { name = 'activate_pane', } },
  { key = '}', mods = 'CTRL|SHIFT', action = action.ActivateTabRelative(1) },
  {
    key = 'y',
    mods = 'CTRL|SHIFT',
    action = action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          print(line)
          window:perform_action(
            action.SwitchToWorkspace { name = line },
            pane
          )
        end
      end),
    },
  },
  { key = '1', mods = 'ALT', action = action.ActivateTab(0) },
  { key = '2', mods = 'ALT', action = action.ActivateTab(1) },
  { key = '3', mods = 'ALT', action = action.ActivateTab(2) },
  { key = '4', mods = 'ALT', action = action.ActivateTab(3) },
  { key = '5', mods = 'ALT', action = action.ActivateTab(4) },
  { key = '9', mods = 'ALT', action = action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
}

config.key_tables = {
  resize_pane = {
    { key = 'h',      action = action.AdjustPaneSize { 'Left', 1 } },
    { key = 'l',      action = action.AdjustPaneSize { 'Right', 1 } },
    { key = 'k',      action = action.AdjustPaneSize { 'Up', 1 } },
    { key = 'j',      action = action.AdjustPaneSize { 'Down', 1 } },
    { key = 'Escape', action = 'PopKeyTable' },
  },
  activate_pane = {
    { key = 'h', action = action.ActivatePaneDirection 'Left' },
    { key = 'l', action = action.ActivatePaneDirection 'Right' },
    { key = 'k', action = action.ActivatePaneDirection 'Up' },
    { key = 'j', action = action.ActivatePaneDirection 'Down' },
  }
}


return config

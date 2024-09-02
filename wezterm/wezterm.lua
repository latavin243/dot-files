local tab_format = require "tab_format"
local wezterm = require "wezterm"
local act = wezterm.action

wezterm.on("format-tab-title", tab_format.format_tab_title)

local config = {}

config.default_prog = { "zsh" }

-- ui
config.harfbuzz_features = { "calt=0" }
config.font = wezterm.font_with_fallback {
  "Iosevka Nerd Font",
}
config.font_size = 14
config.color_scheme = "Ayu Dark (Gogh)"
config.default_cursor_style = 'SteadyBlock'
-- config.default_cursor_style = 'BlinkingBlock'
-- config.cursor_blink_rate = 700


-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = false
-- config.tab_and_split_indices_are_zero_based = false
config.use_fancy_tab_bar = true

-- window
config.enable_scroll_bar = true
-- config.window_background_opacity = 0.85
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }

-- keys
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = "w",  mods = "CMD",       action = act.CloseCurrentPane { confirm = false }, },
  -- { key = "w",  mods = "CMD",       action = act.CloseCurrentTab { confirm = false }, },
  { key = "t",  mods = "CMD",       action = act({ SpawnCommandInNewTab = { cwd = wezterm.home_dir } }), },
  { key = "f",  mods = "CMD|SHIFT", action = wezterm.action.ToggleFullScreen, },

  { key = "q",  mods = "LEADER",    action = act.PaneSelect },
  { key = "%",  mods = "LEADER",    action = wezterm.action.SplitHorizontal {}, },
  { key = "\"", mods = "LEADER",    action = wezterm.action.SplitVertical {}, },

  { key = "[",  mods = "CMD|ALT",   action = act.MoveTabRelative(-1) },
  { key = "]",  mods = "CMD|ALT",   action = act.MoveTabRelative(1) },
}

return config

local wezterm = require "wezterm"
local tab_format = require "tab_format"
local toggle_opacity = require "toggle_opacity"

wezterm.on("format-tab-title", tab_format.format_tab_title)
wezterm.on("toggle-opacity", toggle_opacity.toggle_opacity)

local config = {}

config.default_prog = { "zsh" }

-- ui
config.harfbuzz_features = { "calt=0" }
config.font = wezterm.font_with_fallback {
  "Iosevka Nerd Font",
}
config.font_size = 14
config.color_scheme = "Ayu Dark (Gogh)"
config.default_cursor_style = "SteadyBlock"
-- config.default_cursor_style = "BlinkingBlock"
-- config.cursor_blink_rate = 700


-- tab bar
config.hide_tab_bar_if_only_one_tab               = false
config.show_new_tab_button_in_tab_bar             = false
config.show_tab_index_in_tab_bar                  = true
config.switch_to_last_active_tab_when_closing_tab = false
-- config.tab_and_split_indices_are_zero_based = false
config.use_fancy_tab_bar                          = true


-- window
config.enable_scroll_bar = true
-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 10
config.window_padding    = { left = 0, right = 0, top = 0, bottom = 0, }
config.initial_cols      = 150
config.initial_rows      = 40


-- keys
local act     = wezterm.action
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys   = {
  { key = "f",  mods = "CMD|SHIFT", action = wezterm.action.ToggleFullScreen, },
  { key = "t",  mods = "CMD",       action = act({ SpawnCommandInNewTab = { cwd = wezterm.home_dir } }), },
  { key = "w",  mods = "CMD",       action = act.CloseCurrentPane { confirm = false }, },
  -- { key = "w",  mods = "CMD",       action = act.CloseCurrentTab { confirm = false }, },

  { key = "p",  mods = "CMD|SHIFT", action = act.ActivateCommandPalette },

  { key = "q",  mods = "LEADER",    action = act.PaneSelect },
  { key = "%",  mods = "LEADER",    action = wezterm.action.SplitHorizontal {}, },
  { key = "\"", mods = "LEADER",    action = wezterm.action.SplitVertical {}, },
  { key = 'o',  mods = 'LEADER',    action = act.EmitEvent 'toggle-opacity' },

  { key = "[",  mods = "CMD|ALT",   action = act.MoveTabRelative(-1) },
  { key = "]",  mods = "CMD|ALT",   action = act.MoveTabRelative(1) },

  -- open link
  {
    key = "o",
    mods = "CMD|SHIFT",
    action = act.QuickSelectArgs({
      label = "open url",
      patterns = {
        "\\((https?://\\S+)\\)",
        "\\[(https?://\\S+)\\]",
        "\\{(https?://\\S+)\\}",
        "<(https?://\\S+)>",
        "\\bhttps?://\\S+[)/a-zA-Z0-9-]+"
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info("opening: " .. url)
        wezterm.open_with(url)
      end),
    }),
  },

  -- edit config
  {
    key = ",",
    mods = "CMD",
    action = wezterm.action_callback(function(window, pane)
      local wez_config_path = os.getenv("HOME") .. "/.config/wezterm/wezterm.lua"
      wezterm.log_info("wez config" .. wez_config_path)
      window:perform_action(
        wezterm.action.SpawnCommandInNewTab {
          args = { "nvim", wez_config_path },
          set_environment_variables = { PATH = "/opt/homebrew/bin:" .. os.getenv("PATH") },
        }, pane)
    end),
  },
}

return config

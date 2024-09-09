local wezterm = require("wezterm")
local tab_format = require("tab_format")
local custom = require("custom")

wezterm.on("format-tab-title", tab_format.format_tab_title)
wezterm.on("toggle-opacity", custom.toggle_opacity)

local config = wezterm.config_builder()

config.default_prog = { "zsh" }
config.set_environment_variables = { PATH = "/opt/homebrew/bin:" .. os.getenv("PATH") }

-- ui
config.color_scheme = "Ayu Dark (Gogh)"
config.harfbuzz_features = { "calt=0" }     -- for opacity
config.default_cursor_style = "SteadyBlock" -- BlinkingBlock, etc
-- config.cursor_blink_rate = 700
config.hide_mouse_cursor_when_typing = true

-- font
config.font = wezterm.font_with_fallback({ "Iosevka Nerd Font" })
config.font_size = 14
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = false
-- config.tab_and_split_indices_are_zero_based = false
config.use_fancy_tab_bar = true

-- window
config.enable_scroll_bar = true
-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 10
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.8 }
config.initial_cols = 150
config.initial_rows = 40
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

-- other
config.selection_word_boundary = " \t\n{}[]()\"'`,;:@│┃*…$" -- enable "/-." for git branch
config.audible_bell = "Disabled"

-- keys
local wact = wezterm.action
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "f", mods = "CMD|CTRL",  action = wact.ToggleFullScreen },
	{ key = "t", mods = "CMD",       action = wact({ SpawnCommandInNewTab = { cwd = wezterm.home_dir } }) },
	{ key = "w", mods = "CMD",       action = wact.CloseCurrentPane({ confirm = false }) },
	{ key = "p", mods = "CMD|SHIFT", action = wact.ActivateCommandPalette },
	{ key = "[", mods = "CMD|ALT",   action = wact.MoveTabRelative(-1) },
	{ key = "]", mods = "CMD|ALT",   action = wact.MoveTabRelative(1) },
	{ key = ",", mods = "CMD",       action = wact.SpawnCommandInNewTab({ cwd = wezterm.home_dir, args = { "nvim", wezterm.config_file } }), },

	{ key = "q", mods = "LEADER",    action = wact.PaneSelect },
	{ key = "%", mods = "LEADER",    action = wact.SplitHorizontal({}) },
	{ key = '"', mods = "LEADER",    action = wact.SplitVertical({}) },
	{ key = "o", mods = "LEADER",    action = wact.EmitEvent("toggle-opacity") },
}

-- URLs in Markdown files are not handled properly by default
-- Source: https://github.com/wez/wezterm/issues/3803#issuecomment-1608954312
config.hyperlink_rules = {
	-- Matches: a URL in parens: (URL)
	{
		regex = "\\((\\w+://\\S+)\\)",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in brackets: [URL]
	{
		regex = "\\[(\\w+://\\S+)\\]",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in curly braces: {URL}
	{
		regex = "\\{(\\w+://\\S+)\\}",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in angle brackets: <URL>
	{
		regex = "<(\\w+://\\S+)>",
		format = "$1",
		highlight = 1,
	},
	-- Then handle URLs not wrapped in brackets
	{
		-- Before
		--regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
		--format = '$0',
		-- After
		regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
		format = "$1",
		highlight = 1,
	},
	-- implicit mailto link
	{
		regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
		format = "mailto:$0",
	},
}

return config

local wezterm = require "wezterm"

local module = {}

-- function module.config_wezterm(window, pane)
--   window:perform_action(wezterm.action.SpawnCommandInNewTab {
--     cwd = wezterm.home_dir, args = { 'nvim', wezterm.config_file },
--     set_environment_variables = { PATH = "/opt/homebrew/bin:" .. os.getenv("PATH") },
--   }, pane)
-- end

function module.toggle_opacity(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.75
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end

return module

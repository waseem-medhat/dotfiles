local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.window_decorations = "NONE"
config.color_scheme = 'catppuccin-mocha'
config.enable_tab_bar = false
config.font = wezterm.font('Hack Nerd Font Mono')
config.font_size = 13
config.cell_width = 1.0
config.line_height = 1.10
config.keys = {
    {
        key = 'F11',
        action = wezterm.action.ToggleFullScreen,
    },
}
config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 0,
}


return config

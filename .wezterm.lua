local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.font = wezterm.font_with_fallback { 'Fira Code', 'JetBrains Mono' }

-- config.color_scheme = 'Solarized Dark - Patched'
-- config.color_scheme = 'Solarized (dark) (terminal.sexy)'
-- config.color_scheme = 'Selenized Dark (Gogh)'
-- config.color_scheme = 'Solarized Darcula (Gogh)'
config.color_scheme = 'Solarized Dark (Gogh)'
-- config.color_scheme = 'Solarized Light (Gogh)'
-- config.color_scheme = 'Catppuccin Latte'

config.hide_tab_bar_if_only_one_tab = true

config.initial_cols = 200
config.initial_rows = 60

return config


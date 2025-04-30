local wezterm = require 'wezterm'

local is_darwin = wezterm.target_triple:find("darwin") ~= nil
local is_linux = wezterm.target_triple:find("linux") ~= nil
local is_windows = wezterm.target_triple:find("windows") ~= nil

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- OS specific
if is_windows then
    config.default_domain = 'WSL:Ubuntu'
    config.window_decorations = "TITLE | RESIZE"
else
    config.window_decorations = "RESIZE"
end

-- Config
config.default_prog = { 'tmux' }

-- Style
config.font_size = 13.0
config.font = wezterm.font({
    family = 'VictorMono Nerd Font',
    style = 'Normal',
    weight = 'DemiBold'
})
config.color_scheme = 'Atelier Plateau (base16)'
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
    left = '1cell',
    right = '1cell',
    top = 0,
    bottom = 0,
}

wezterm.on('format-window-title', function()
    local title = ''
    return title
end)

return config

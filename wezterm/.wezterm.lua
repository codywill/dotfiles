local wezterm = require 'wezterm'

wezterm.log_info(wezterm.target_triple)

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
elseif is_linux then
    config.window_decorations = "NONE"
end

-- Default program
config.default_prog = { 'tmux' }

-- Style
local default_font_size = 14
local font_size = default_font_size
local resolution_to_font_size = {
    ["3840x2160"] = 14,
    ["2560x1440"] = 12.5,
    ["1920x1200"] = 13.1,
}

local function recompute_font_size(window)
    local dimensions = window:get_dimensions()
    local resolution = string.format("%dx%d", dimensions.pixel_width, dimensions.pixel_height)
    local overrides = window:get_config_overrides() or {}

    overrides.font_size = resolution_to_font_size[resolution]

    window:set_config_overrides(overrides)
end

config.font_size = font_size
config.font = wezterm.font({
    family = 'VictorMono Nerd Font',
    style = 'Normal',
    weight = 'DemiBold'
})
config.color_scheme = 'Atelier Plateau (base16)'
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.window_background_opacity = 0.96
config.initial_rows = 40
config.initial_cols = 150

wezterm.on('format-window-title', function()
    local title = ''
    return title
end)

wezterm.on('window-resized', function(window)
    recompute_font_size(window)
end)

return config

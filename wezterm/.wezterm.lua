local wezterm = require 'wezterm'

local is_darwin <const> = wezterm.target_triple:find("darwin") ~= nil
local is_linux <const> = wezterm.target_triple:find("linux") ~= nil
local is_windows <const> = wezterm.target_triple:find("windows") ~= nil

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- OS specific
if is_windows then
	config.default_domain = 'WSL:Ubuntu'
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

wezterm.on('format-window-title', function()
	local title = ''
	return title
end)

return config


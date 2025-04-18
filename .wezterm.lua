local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Gruvbox"
config.color_scheme = "Gruvbox dark, medium (base16)"
config.enable_wayland = true
config.font_size = 15.0

-- Config launch menu
config.launch_menu = {
	{
		label = "New window with Tmux",
		args = { "tmux" },
	},
}

-- Config keys
config.keys = {
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action.ShowLauncher,
	},
}

return config

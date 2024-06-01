local wezterm = require("wezterm")

local config = {
    term = "xterm-256color",
    color_scheme = "Catppuccin Mocha",
    font = wezterm.font("FiraCode Nerd Font Mono"),
    font_size = 12,
    enable_tab_bar = true,
    tab_bar_at_bottom = true,
    window_background_opacity = 0.7,
    macos_window_background_blur = 20,
    keys = {
        {
            key = "n",
            mods = "SHIFT|CTRL",
            action = wezterm.action.ToggleFullScreen,
        },
    },
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    default_prog = { "/opt/homebrew/bin/fish" },
    window_decorations = "NONE",
}

return config

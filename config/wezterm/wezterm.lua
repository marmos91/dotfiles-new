local wezterm = require("wezterm")

local config = {
    term = "xterm-256color",
    color_scheme = "Catppuccin Mocha",
    font = wezterm.font("FiraCode Nerd Font Mono"),
    font_size = 12,
    enable_tab_bar = true,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = false,
    window_background_opacity = 0.7,
    window_close_confirmation = "NeverPrompt",
    macos_window_background_blur = 20,
    keys = {
        {
            key = "n",
            mods = "SHIFT|CTRL",
            action = wezterm.action.ToggleFullScreen,
        },
    },
    initial_rows = 40,
    initial_cols = 133,
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

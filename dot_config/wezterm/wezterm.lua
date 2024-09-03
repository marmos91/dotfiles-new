local wezterm = require("wezterm")

local config = wezterm.config_builder()
local action = wezterm.action

-- Functions and utilities
-- Vim integration
local function is_vim(pane)
    -- this is set by the plugin, and unset on ExitPre in Neovim
    return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
    Left = "h",
    Down = "j",
    Up = "k",
    Right = "l",
    -- reverse lookup
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
}

local function split_nav(resize_or_move, key)
    return {
        key = key,
        mods = resize_or_move == "resize" and "META" or "CTRL",
        action = wezterm.action_callback(function(win, pane)
            if is_vim(pane) then
                -- pas the keys through to vim/nvim
                win:perform_action({
                    SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
                }, pane)
            else
                if resize_or_move == "resize" then
                    win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
                else
                    win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
                end
            end
        end),
    }
end

-- Appearance
config.term = "xterm-256color"
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 13
config.front_end = "OpenGL"
config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "HorizontalLcd"
config.window_close_confirmation = "NeverPrompt"
config.initial_rows = 40
config.initial_cols = 133
config.window_decorations = "RESIZE"
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false

-- Tabs
config.tab_max_width = 24
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- config.window_frame = {
--     -- The font used in the tab bar.
--     -- Roboto Bold is the default; this font is bundled
--     -- with wezterm.
--     -- Whatever font is selected here, it will have the
--     -- main font setting appended to it to pick up any
--     -- fallback fonts you may have used there.
--     font = wezterm.font({ family = "MesloLGS Nerd Font", weight = "Bold" }),
--
--     -- The size of the font in the tab bar.
--     -- Default to 10.0 on Windows but 12.0 on other systems
--     font_size = 12.0,
--
--     -- The overall background color of the tab bar when
--     -- the window is focused
--     active_titlebar_bg = "#333333",
--
--     -- The overall background color of the tab bar when
--     -- the window is not focused
--     inactive_titlebar_bg = "#333333",
-- }
--
-- config.colors = {
--     tab_bar = {
--         background = "#1e1e2e", -- Dark background color matching Catppuccin Mocha
--         active_tab = {
--             bg_color = "#313244", -- Slightly lighter background for the active tab
--             fg_color = "#c0caf5", -- Light foreground color for active tab text
--             intensity = "Bold", -- Optional: make the text bold for active tab
--         },
--         inactive_tab = {
--             bg_color = "#2a273f", -- Darker background for inactive tabs
--             fg_color = "#6c7086", -- Lighter foreground color for inactive tab text
--         },
--         inactive_tab_hover = {
--             bg_color = "#3e3b5a", -- Slightly lighter color for inactive tabs on hover
--             fg_color = "#c0caf5", -- Light foreground color for inactive tab text on hover
--         },
--         new_tab = {
--             bg_color = "#2a273f", -- Background color of the new tab button
--             fg_color = "#c0caf5", -- Foreground color of the new tab button
--         },
--     },
-- }

-- Padding
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}

-- Leader
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

-- Keybindings
config.use_dead_keys = false

config.keys = {
    -- splitting
    {
        mods = "LEADER",
        key = "-",
        action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        mods = "LEADER",
        key = "|",
        action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    -- Zoom
    {
        mods = "LEADER",
        key = "z",
        action = action.TogglePaneZoomState,
    },
    -- Manage tabs
    {
        mods = "LEADER",
        key = "n",
        action = action.ActivateTabRelative(1),
    },
    {
        mods = "LEADER",
        key = "p",
        action = action.ActivateTabRelative(-1),
    },
    {
        mods = "LEADER",
        key = "c",
        action = action.SpawnTab("CurrentPaneDomain"),
    },
    -- CopyMode
    {
        mods = "LEADER",
        key = "[",
        action = wezterm.action.ActivateCopyMode,
    },
    -- rotate panes
    {
        mods = "LEADER",
        key = "r",
        action = wezterm.action.RotatePanes("Clockwise"),
    },
    -- show the pane selection mode, but have it swap the active and selected panes
    {
        mods = "LEADER",
        key = "0",
        action = wezterm.action.PaneSelect({
            mode = "SwapWithActive",
        }),
    },
    -- move between split panes
    split_nav("move", "h"),
    split_nav("move", "j"),
    split_nav("move", "k"),
    split_nav("move", "l"),
    -- resize panes
    split_nav("resize", "h"),
    split_nav("resize", "j"),
    split_nav("resize", "k"),
    split_nav("resize", "l"),
    -- Workspaces
    {
        mods = "LEADER",
        key = "w",
        action = wezterm.action.PromptInputLine({
            description = "Enter workspace name",
            action = wezterm.action_callback(function(win, pane, line)
                if line then
                    win:perform_action(action.SwitchToWorkspace({ name = line }), pane)
                end
            end),
        }),
    },
    {
        mods = "LEADER",
        key = "s",
        action = wezterm.action.ShowLauncherArgs({
            flags = "WORKSPACES",
        }),
    },
}

-- Default shell
config.default_prog = { "/run/current-system/sw/bin/fish", "-l" }

return config


local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
--suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
hl.window_rule({
    name = "browser",
    match = {
        class = "firefox-nightly",
    },
    workspace = 1
})
hl.window_rule({
    name = "games",
    match = {
        class = "gamescope"
    },
    workspace = 5
})
hl.window_rule({
    name = "vesktop",
    match = {
        class = "vesktop"
    },
    workspace = 3
})
hl.window_rule({
    name = "vscodium",
    match = {
        class = "codium",
    },
    workspace = 4
})
hl.window_rule({
    name = "obs",
    match = {
        class = "com.obsproject.Studio",
    },
    workspace = 6,
})
hl.window_rule({
    name = "spotify",
    match = {
        class = "spotify",
    },
    workspace = 2,
})
hl.window_rule({
    name = "dolphin",
    match = {
        class = "dolphin",
    },
    float = true,
})
hl.window_rule({
    name = "kdeconnect",
    match = {
        class = "org.kde.kdeconnect.app",
    },
    float = true,
})
hl.window_rule({
    name = "hyprpwcenter",
    match = {
        class = "hyprpwcenter",
    },
    float = true,
})
hl.window_rule({
    name = "hyprland-share-picker",
    match = {
        class = "hyprland-share-picker",
    },
    float = true,
})
hl.window_rule({
    name = "steam",
    match = {
        class = "steam",
    },
    tag = "gamelaunch",
})
hl.window_rule({
    name = "lutris",
    match = {
        class = "lutris",
    },
    tag = "gamelaunch"
})
hl.window_rule({
    name = "prism",
    match = {
        class = "org.prismlauncher.PrismLauncher",
    },
    tag = "gamelaunch",
})
hl.window_rule({
    name = "gamelaunch move",
    match = {
        tag = "gamelaunch",
    },
    workspace = 2,
})



-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

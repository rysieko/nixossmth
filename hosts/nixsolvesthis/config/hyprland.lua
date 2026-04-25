local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"
require(./var.lua)
hl.on("hyprland.start", function () 
  hl.exec_cmd("steam")
  hl.exec_cmd("swaync")
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww img ${config.stylix.image}")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("vesktop")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("wl-paste --type text --watch-cliphist-store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("spotify")
  hl.exec_cmd("kdeconnectd")
end)
hl.config({
    input = {
        kb_layout  = "pl",
        follow_mouse = 1,
        sensitivity = 0.9, 
        touchpad = {
            natural_scroll = false,
        },
    },
})
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@180",
    position = "0x0",
    scale = 1,
    bitdepth = 10,
    cm = "hdr",
    vrr = 0,
    supports_hdr = 1,
    supports_wide_color = 1,
    sdr_max_luminance = 145,
    sdr_min_luminance = 0.035,
    sdr_eotf = 1,
})
hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true,
        middle_click_paste = false,
    },
})
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border   = "rgb(base0D-r,base0D-g,base0D-b)",
            inactive_border = "rgb(base03-r,base03-g,base03-b)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
})
hl.config({
    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = rgb(0,0,0),
        },

        -- https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
            enabled   = false,
        },
    },
})
hl.config({
    animations = {
        enabled = true,
    },
})
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("slidefade",      { type = "bezier", points = { {0.42, 0.71}  {0.6, 0.97}  } })
-- Default animations, see https://wiki.hypr.land/Configuring/Animations/
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "slidefade", style = "slidefade 30%" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "slidefade", style = "slidefade 30%" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Tab", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(1)
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod SHIFT ..+ "P", hl.dsp.exec_cmd("hyprpicker -f rgb -a"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("spotifycli --next"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("spotifycli --prev"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("spotifycli --playpause"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -o ~/Obrazy/Screenshots/ -z -t 0 --mode region "))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("pkill -9 gamescope"))
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("pkill -9 steam"))
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("pkill -9 waybar | waybar"))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("pkill -9 awww; awww img ${config.stylix.image} "))
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(CTRL .. " + SHIFT + " .. key,        hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.layer_rule({
    name = "no_anim_for_selection",
    no_anim = "on",
    match{ namespace = "selection", },
})

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


-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

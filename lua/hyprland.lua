mainMod     = "SUPER"
terminal    = "kitty"
fileManager = "dolphin"
menu        = "hyprlauncher"
require("var")
require("addons/scripts")
require("windows")
require("binds")

hl.on("hyprland.start", function()
  hl.exec_cmd("steam")
  hl.exec_cmd("swaync")
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww-daemon")
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
    kb_layout    = "pl",
    follow_mouse = 1,
    sensitivity  = 0.9,
    touchpad     = {
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
  sdr_max_luminance = 135,
  sdr_min_luminance = 0.035,
  sdrbrightness = 0.9,
  sdr_eotf = 1,
})
hl.config({
  misc = {
    force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true,
    middle_click_paste      = false,
  },
})
hl.config({
  general = {
    gaps_in          = 5,
    gaps_out         = 10,
    border_size      = 2,
    col              = {
      active_border   = "rgb(" .. base0D_r .. "," .. base0D_g .. "," .. base0D_b .. ")",
      inactive_border = "rgb(" .. base03_r .. "," .. base03_g .. "," .. base03_b .. ")",
    },
    resize_on_border = false,
    allow_tearing    = false,
    layout           = "dwindle",
  },
})
hl.config({
  decoration = {
    rounding         = 10,
    rounding_power   = 2,

    -- Change transparency of focused and unfocused windows
    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow           = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = "rgb(0,0,0)",
    },

    -- https://wiki.hypr.land/Configuring/Variables/#blur
    blur             = {
      enabled = false,
    },
  },
})
hl.config({
  animations = {
    enabled = true,
  },
})
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("slidefade", { type = "bezier", points = { { 0.42, 0.71 }, { 0.6, 0.97 } } })
-- Default animations, see https://wiki.hypr.land/Configuring/Animations/
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "slidefade", style = "slidefade 30%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "slidefade", style = "slidefade 30%" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.layer_rule({
  name = "no_anim_for_selection",
  no_anim = true,
  match = { namespace = "selection", },
})

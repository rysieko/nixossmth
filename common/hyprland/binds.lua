local s           = require("addons/scripts")

ipc               = "noctalia msg"
local mainMod     = "SUPER"
local terminal    = "ghostty +new-window"
local fileManager = "ghostty +new-window -e  nu -c yazi "
local menu        = " noctalia msg panel-toggle launcher"




hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + q", function()
  s:endApp(hl.get_active_window())
end)
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd(ipc .. "panel-open session"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Tab", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(1))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. "+ SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mainMod .. " + PRINT",
  hl.dsp.exec_cmd(
    "grim -g \"$(slurp -d)\" - | wl-copy && wl-paste > $(xdg-user-dir PICTURES)/Screenshots/Screenshot_$(date +%F_%T).png | sleep 2; notify-send \"Screenshot took and copied\" \" :) \" "))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(ipc .. " panel-toggle wallpaper"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(ipc .. " wallpaper-random"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode | wl-copy"))
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + 0-9
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind("CTRL + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

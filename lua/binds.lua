
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Tab", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(1))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. "+ SHIFT + P", hl.dsp.exec_cmd("hyprpicker -f rgb -a"))
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
    hl.bind("CTRL + SHIFT + " .. key,        hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
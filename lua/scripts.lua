hl.on("layer.opened", function(l)
    if l.namespace == "hyprlock" then
        hl.timer({timeout = 100})
        hl.exec_cmd("pkill -9 awww-daemon")
    end
end)
hl.on("layer.closed",function(l)
    if l.namespace ~= "awww-daemon" and l.namespace ~= "hyprlock" then
        hl.exec_cmd("aww-daemon")
    end 
end)
hl.on("window.active", function (w)
    if w.namespace == "gamescope" then
        hl.exec_cmd("pkill -9 aww-daemon")
        hl.dsp.toggle_special("game")
        hl.dsp.move({ 0.0 })
    end
end)
hl.on("window.kill",function (w)
    if w.namespace == "gamescope" then
        hl.exec_cmd("aww-daemon")
        hl.dsp.toggle_special("game")
    end
end)    

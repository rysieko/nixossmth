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
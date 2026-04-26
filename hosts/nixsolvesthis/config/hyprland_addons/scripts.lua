hl.on("layer.opened", "hyprlock", function()
    hl.timer({timeout = 100})
    hl.exec_cmd("pkill -9 aww-daemon")
end)
hl.on("layer.closed", "hyprlock",function()
    hl.exec_cmd("aww-daemon")

)
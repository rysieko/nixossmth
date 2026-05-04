local s = {}
-- end app if not gamescope otherwise SIGKILL it
function s:endApp(window)
  if window.class == "gamescope" then
    hl.dispatch(hl.dsp.window.kill(window))
  else
    hl.dispatch(hl.dsp.window.close(window))
  end
end

return s

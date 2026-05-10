{...}:
{
 services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
        #   command = "uwsm start hyprland.desktop";
      user = "rysieko";
      command = "niri-session";
    };
    default_session = initial_session;
    };
  };
}

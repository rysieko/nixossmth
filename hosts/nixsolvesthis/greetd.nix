{...}:
{
 services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
        #   command = "uwsm start hyprland.desktop";
      user = "rysieko";
      command = "uwsm start hyprland.desktop";
    };
    default_session = initial_session;
    };
  };
}

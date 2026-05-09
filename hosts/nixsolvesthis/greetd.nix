{...}:
{
 services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "uwsm start hyprland.desktop";
      user = "rysieko";
    };
    default_session = initial_session;
    };
  };
}

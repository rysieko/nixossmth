{...}:
{
 services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "start-hyprland";
      user = "rysieko";
    };
    default_session = initial_session;
    };
  };
}

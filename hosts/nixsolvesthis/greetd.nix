{...}:
{
 services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "niri-session";
      user = "rysieko";
    };
    default_session = initial_session;
    };
  };
}

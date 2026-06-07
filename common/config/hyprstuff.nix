{...}: {
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hjem.users.rysieko.files = {
    ".config/hypr/hyprland.lua".source = ../hyprland/hyprland.lua;
    ".config/hypr/addons/scripts.lua".source = ../hyprland/addons/scripts.lua;
    ".config/hypr/binds.lua".source = ../hyprland/binds.lua;
    ".config/hypr/windows.lua".source = ../hyprland/windows.lua;
  };
}

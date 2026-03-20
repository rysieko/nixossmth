{ pkgs ,...}:

{
  programs.firefox = {
      enable = true;
     };
  programs.waybar.enable = true;   
  programs.thunar.enable = true;
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     vscode
     nano # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     protonup-ng
     hyprland-qt-support
     git
     cliphist
     vesktop
     prismlauncher
     lutris
     nordic
     candy-icons
     catppuccin-grub    
     hyprlauncher
#     nordzy-theme
     fastfetch
     spotify-cli-linux
     btop
     spotify
     godot
     mangohud
     udiskie
     wine
     kitty
     hyprshutdown
     grim
     slurp
     swaynotificationcenter
     wlogout
     gh

   ];
   fonts.packages = with pkgs.nerd-fonts; [
	  fira-code
	  droid-sans-mono
	  noto
	  hack
	  ubuntu
   ];
  programs.git = {
    enable = true;
  };
  programs.neovim = {
    enable = true;
    };
  programs.gamescope.enable = true;
}

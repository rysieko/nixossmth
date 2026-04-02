{ pkgs ,...}:

{
  # https://search.nixos.org/
   environment.systemPackages = with pkgs; [
     wget
     protonup-ng
     hyprland-qt-support
     git
     cliphist
     prismlauncher
     lutris
     nordic
     candy-icons
     catppuccin-grub    
     hyprlauncher
     fastfetch
     spotify-cli-linux
     btop
     spotify
     godot-mono
     mangohud
     udiskie
     wine
     kitty
     hyprshutdown
     swaynotificationcenter
     wlogout
     hyprpaper
     gh
     hyprshot
     pavucontrol
     cmatrix
     feh
     hyprpwcenter
     kdePackages.dolphin
     dolphin-emu
     melonds
     obs-studio
     hyprpicker
     kdePackages.kdenlive
     ffmpeg_7-full
   ];
   fonts.packages = with pkgs.nerd-fonts; [
	  fira-code
	  droid-sans-mono
	  noto
	  hack
	  ubuntu
   ];
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.kdeconnect.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  programs.gamescope.enable = true;
}

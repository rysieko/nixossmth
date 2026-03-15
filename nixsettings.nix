{config , inputs, ... }:

{
 nix.settings = {
        substituters = ["https://hyprland.cachix.org" "https://attic.xuyh0120.win/lantian"];
        trusted-substituters = ["https://hyprland.cachix.org" "https://attic.xuyh0120.win/lantian"];
        trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="  ];
 };
}

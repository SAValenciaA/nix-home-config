{pkgs, lib, ...} : {

  imports = [
    ./wofi.nix
    ./kitty.nix
    ./waybar.nix
    ./zathura.nix
    ./hyprland.nix
    ./hyprlock.nix
#    ./hyprpaper.nix
  ];
  
}

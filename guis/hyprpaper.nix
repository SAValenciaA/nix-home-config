{services, pkgs,  inputs, lib, ...}: {

  services.hyprpaper =  {

    enable = true;

    settings = {

      preload = [
        "~/.config/hypr/Wallpapers/WP2.png"
        "~/.config/hypr/Wallpapers/WP8.jpg"
      ];
      wallpaper = [
        "eDP-1,contain:~/.config/hypr/Wallpapers/WP2.png"
        "HDMI-A-1,contain:~/.config/hypr/Wallpapers/WP8.jpg"
      ];

    };

  };

}

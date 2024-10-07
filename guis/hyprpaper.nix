{services, pkgs,  inputs, lib, ...}: {

  services.hyprpaper =  {

    enable = true;

    settings = {

      preload = [
        "~/Pictures/wallpaper/mainWallpaper.png"
      ];
      wallpaper = [
        "eDP-1,contain:~/Pictures/wallpaper/mainWallpaper.png"
        "HDMI-A-1,contain:~/Pictures/wallpaper/mainWallpaper.png"
      ];

    };

  };

}

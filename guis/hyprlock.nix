{programs, pkgs,  inputs, lib, ...}: {
  programs.hyprlock = lib.mkForce {

    enable = true;

    settings = {

      source = "~/.cache/wal/colors-hyprland.conf";

      # BACKGROUND
      background = {
        monitor = "";
        path = "~/Pictures/wallpaper/lockWallpaper.jpg";
        # 0 disables blurring;
        blur_passes = 0;
        blur_size = 7;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;

      };

      # GENERAL
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = true;
      };

      # INPUT FIELD
      input-field = {
        monitor = "";
        size = "250, 60";
        outline_thickness = 2;
        # Scale of input-field height, 0.2 - 0.8;
        dots_size = 0.2 ;
        # Scale of dots' absolute size, 0.0 - 1.0;
        dots_spacing = 0.2 ;
        dots_center = true;
        outer_color = "rgb(137, 180, 250)";
        inner_color = "rgba(0, 0, 0, 0.8)";
        fail_color = "rgb(192,112,112)";
        rounding = 0;
        font_color = "rgb(137, 180, 250)";
        fail_text = "<i><span foreground=\"##222222\">$ATTEMPTS</span></i>";
        fade_on_empty = false;
        font_family = "JetBrains Mono Nerd Font Mono";
        hide_input = false;
        position = "-25, -25";
        halign = "right";
        valign = "top";
        placeholder_text = "";
        shadow_passes = 3;
        shadow_size = 5;
        shadow_color = "rgb(137, 180, 250)";
        shadow_boost = 1.2;
      };

      # CURRENT SONG
      label = {
        monitor = "";
        text = "cmd[update:1000] echo \"$(~/Pictures)\"";
        color = "$foreground";
        #color = rgba(255, 255, 255, 0.6);
        font_size = 18;
        font_family = "JetBrainsMono, Font Awesome 6 Free Solid";
        position = "0, -50";
        halign = "center";
        valign = "bottom";
      };

    };

  };

}

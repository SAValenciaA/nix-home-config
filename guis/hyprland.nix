{programs, pkgs,  inputs, lib, ...}: {
  wayland.windowManager.hyprland = lib.mkForce {
    enable = true;
    settings = {

      "monitor" = ",preferred,auto,auto";
      "exec-once" = [
        "~/.config/hypr/xdg-portal-hyprland"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        "waybar"
        "hyprpaper"
      ];

      input = {                                                                                
          kb_layout = "latam";
          follow_mouse = 1;
          touchpad = {
              natural_scroll = "no";
          };
          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
          gaps_in = 8;
          gaps_out = 6;
          border_size = 2;
          #col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg;
          "col.active_border"="rgb(89b4fa)";
          "col.inactive_border" = "rgba(11111180)";
          layout = "dwindle";
          resize_on_border = true;
      };

      misc = {
          disable_hyprland_logo = "yes";
      };

      decoration = {
          rounding = 0;
          blur = { 
              enabled = false;
          };
          drop_shadow = "yes";
          shadow_range = 150;
          shadow_render_power = 4;
          "col.shadow" = "rgba(89b4fa50)";
          shadow_offset = "0 0";
          shadow_scale = 0.9;
      };

      animations = {
          enabled = "yes";
          # define animation.. smothity? idk how it is called
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          # Animations
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
      };

      dwindle = {
          # master switch for pseudotiling. Enabling is bound to 
          # mainMod + P in the keybinds section below
          pseudotile = "yes";
          # you probably want this
          preserve_split = "yes"; 
      };

      windowrule = [
        "float,title:^(floating)$"
        "size 50% 50%, title:^(floating)"
        "bordersize 0, class:^(VirtualBox Machine)$"
        "noborder, class:^(VirtualBox Machine)$"
      ];

      "$mainMod" = "SUPER";

      bindm = [
        "$mainMod, mouse:273, resizewindow"
        "$mainMod SHIFT, mouse:272, pin"
        "$mainMod, mouse:272, movewindow"
      ];

      bind = [
        #=========================================================================
        # Applications management
        "$mainMod, Q, exec, kitty" #open the terminal
        "$mainMod, code:60, exec, hyprlock" # Lock the screen
        "$mainMod SHIFT, M, exit," # Exit Hyprland all together no (force quit Hyprland)
        "$mainMod, E, exec, kitty lf" # Open file manager
        "$mainMod, SPACE, exec, wofi" # Show the graphicall app launcher
        "$mainMod, S, exec, grim -g \"$(slurp)\" - | swappy -f -" # take a screenshot
        #=========================================================================

        #=========================================================================
        # Window management
        "$mainMod SHIFT, X, killactive," # close the active window
        "$mainMod, V, togglefloating," # Allow a window to float
        "$mainMod, P, pseudo," # dwindle

        # Resize Window
        "$mainMod CONTROL, l, resizeactive, 100 0"
        "$mainMod CONTROL, h, resizeactive, -100 0"
        "$mainMod CONTROL, k, resizeactive, 0 -100"
        "$mainMod CONTROL, j, resizeactive, 0 100"
        #=========================================================================
        #=========================================================================
        # System management
        ",156, exec, rog-control-center" # ASUS Armory crate key
        ",211, exec, asusctl profile -n; pkill -SIGRTMIN+8 waybar" # Fan Profile key switch between power profiles
        ",121, exec, pamixer -t" # Speaker Mute FN+F1
        ",122, exec, pamixer -d 5" # Volume lower key
        ",123, exec, pamixer -i 5" # Volume Higher key
        ",256, exec, pamixer --default-source -t" # Mic mute key
        ",232, exec, brightnessctl set 10%-" # Screen brightness down FN+F7
        ",233, exec, brightnessctl set 10%+" # Screen brightness up FN+F8
        ",237, exec, brightnessctl -d asus::kbd_backlight set 33%-" # Keyboard brightness down FN+F2
        ",238, exec, brightnessctl -d asus::kbd_backlight set 33%+" # Keyboard brightnes up FN+F3
        ",210, exec, asusctl led-mode -n" # Switch keyboard RGB profile FN+F4
        "$mainMod, t, exec, notify-send \"The tempeture is $(acpi -t | tail -n 1 | cut -d \" \" -f 4)°\" "
        #=========================================================================

        #=========================================================================
        # Movement

        # Selected window movement
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"

        # Window movement
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        # Window movement inter-workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Workspace movement
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Workspace lateral movement
        "$mainMod, u, workspace, e-1"
        "$mainMod, o, workspace, e+1"
        #=========================================================================

        # PERSONAL SHORTCUTS
        "ALT SHIFT, h, exec, kitty -T floating htop"
        "ALT SHIFT, q, exec, kitty -T floating"
        "ALT SHIFT, e, exec, kitty -T floating lf"
        "ALT SHIFT, p, exec, kitty -T floating ipython"
      ];


    };
  };
}

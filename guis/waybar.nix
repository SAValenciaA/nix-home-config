{programs, pkgs,  inputs, lib, ...} : {

  programs.waybar = lib.mkForce {
    enable = true;
    settings = {
      mainBar = {
        "layer" = "top";
        "position" = "top";
        "mod" = "dock";
        "exclusive" = true;
        "passthrough" = false;
        "gtk-layer-shell" = true;
        "height" = 10;
        "modules-left" = ["pulseaudio" "pulseaudio#microphone" "network" "bluetooth"  "temperature" "battery"];
        "modules-center" = ["hyprland/workspaces"];
        "modules-right" = ["clock" "custom/weeks"];
        "hyprland/window" = {
            "format" = "{}";
        };
        "custom/weeks" = {
            "exec" = "echo $(( ($(date -d \"Oct 22 2076\" +%s) - $(date +%s)) / 604800  ))";
            "format" = " |   {} before  ";
            "interval" = 3600;
        };

        "hyprland/workspaces" ={
            "disable-scroll" = false;
            "all-outputs" = true;
            "on-click" = "activate";
            "persistent_workspaces" = {
                "1" = [];
                "2" = [];
                "3" = [];
                "4" = [];
                "5" = [];
                "6" = [];
                "7" = [];
                "8" = [];
                "9" = [];
                "10" = [];
            };
        };

        "clock" = {
            "format" = "{:%I:%M %p    %a  %b %e}";
            "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "battery" = {
            "states" = {
                "good" = 95;
                "warning" = 30;
                "critical" = 20;
            };
            "interval" = 30;
            "format" = "{icon} {capacity}%";
            "format-charging" = " {capacity}%";
            "format-plugged" = " {capacity}%";
            "format-icons" = ["󰂎"  "󰁺"  "󰁻"  "󰁼"  "󰁽"  "󰁾"  "󰁿"  "󰂀"  "󰂁"  "󰂂"  "󰁹"];
            "on-update" = "bash /home/sergio/Scripts/lowBattery/lowBattery";
        };

        "pulseaudio" = {
            "format" = "{icon} {volume}%";
            "tooltip" = false;
            "format-muted" = " Muted";
            "on-click" = "pamixer -t";
            "on-scroll-up" = "pamixer -i 5";
            "on-scroll-down" = "pamixer -d 5";
            "scroll-step" = 5;
            "format-icons" = {
                "headphone" = "";
                "hands-free" = "";
                "headset" = "";
                "phone" = "";
                "portable" = "";
                "car" = "";
                "default" = ["" "" ""];
            };
        };

        "pulseaudio#microphone" = {
            "format" = "{format_source}";
            "format-source" = " {volume}%";
            "format-source-muted" = " Muted";
            "on-click" = "pamixer --default-source -t";
            "on-scroll-up" = "pamixer --default-source -i 5";
            "on-scroll-down" = "pamixer --default-source -d 5";
            "scroll-step" = 5;
        };
        
        "temperature" = {
            "thermal-zone" = 0;
            "format" = " {temperatureC}°C";
            "critical-threshold" = 80;
            "format-critical" = " {temperatureC}°C";
        };

        "network" = {
            "format-wifi" = "  {signalStrength}%";
            "format-ethernet" = "{ipaddr}/{cidr}";
            "tooltip-format" = "{essid} - {ifname} via {gwaddr}";
            "format-linked" = "{ifname} (No IP)";
            "format-disconnected" = "Disconnected ⚠";
            "format-alt" = "  {signalStrength}%";
            "on-click" = "kitty -T floating nmtui";
        };

        "bluetooth" = {
          "format" = " {status}";
          "format-disabled" = "";
          "format-connected" = " {num_connections}";
          "tooltip-format" = "{device_alias}";
          "tooltip-format-connected" = " {device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}";
        };
      };
    };

    style = ''
      * {
        border: 0.2px solid transparent;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-weight: bold;
        font-size: 16px;
        min-height: 0;
        background: transparent;
      }

      #waybar {
      }

      tooltip {
        background: #11111a;
      }

      #workspaces button {
        padding: 2px 4px;
        color: #85fa89;
        background: #222222;
        margin-left: 0;
        margin-right: 0;
        transition-duration: 0.3s;
      }

      #workspaces button:hover,
      #workspaces button.urgent #workspaces button.focused,
      #workspaces button.active {
        transition-duration: 0.3s;
        background: #85fa89;
        color: #222222;
      }

      #pulseaudio,
      #pulseaudio.microphone.source-muted {
        color: #fa8585;
        background-color: #222222;
      }

      #pulseaudio.microphone,
      #pulseaudio.muted {
        background: #fa8585;
        color: #222222;
        transition-duration: 0.3s;
      }

      #bluetooth,
      #network {
        color: #89b4fa;
        background-color: #222222;
      }

      #network.disconnected,
      #bluetooth.connected {
        background-color: #89b4fa;
        color: #222222;
      }

      #temperature,
      #battery {
        color: #85fa89;
        background-color: #222222;
      }

      #temperature.critical,
      #battery:hover {
        background-color: #85fa89;
        color: #222222;
      }

      #clock,
      #custom-weeks {
        color: #fafa85;
        background-color: #222222;
        border-radius: 0;
        border-right: 0px;
      }

      #custom-power_profile,
      #custom-weather,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #bluetooth,
      #temperature,
      #workspaces,
      #tray,
      #backlight,
      #custom-weeks {
        padding: 0 8px;
        margin-left: 0;
        margin-right: 0;
        transition-duration: 0.3s;
      }

    '';
  };

}

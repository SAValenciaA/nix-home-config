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
        "modules-left" = ["hyprland/workspaces"];
        "modules-center" = ["clock"];
        "modules-right" = ["pulseaudio#microphone" "network" "battery"];
        "hyprland/window" = {
            "format" = "{}";
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
            "format" = "    {:%I:%M %p | %a  %b %e}";
            "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
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
        
        "network" = {
            "format-wifi" = "  {signalStrength}%";
            "format-ethernet" = "{ipaddr}/{cidr}";
            "tooltip-format" = "{essid} - {ifname} via {gwaddr}";
            "format-linked" = "{ifname} (No IP)";
            "format-disconnected" = "Disconnected ⚠";
            "format-alt" = "IP: {ipaddr}/{cidr}";
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
        background: rgba(0,0,0,0);
      }

      #waybar {
        background: rgba(0,0,0,0.8)
      }

      tooltip {
        background: #11111a;
      }

      #workspaces button {
        color: #444444;
        transition-duration: 0.5s;
      }

      #workspaces button:hover,
      #workspaces button.urgent #workspaces button.focused,
      #workspaces button.active {
        color: #89b4fa;
        text-shadow: none;
        transition-duration: 0.5s;
      }
      #workspaces button:hover {
        color: #89b4fa;
        text-shadow: 0 0 6px #89b4fa;
      }

      #network {
        background: rgba(0,0,0,0);
      }

      #network.disconnected,
      #bluetooth.connected {
        background-color: #89b4fa;
        color: #222222;
      }

      #clock{
        background: transparent;
        border-radius: 0;
        border-right: 0px;
      }

      #battery {
        background: rgba(0,0,0,0.1);
      }

      #pulseaudio.microphone.source-muted {
        color: #89b4fa;
        background: none;
        text-shadow: 0 0 6px #89b4fa;
      }

      #pulseaudio.microphone {
        background: #89b4fa;
        color: rgba(0,0,0,0.9);
        text-shadow: 0 0 6px rgba(0,0,0,0.9);
      }

      #custom-power_profile,
      #custom-weather,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #temperature,
      #workspaces,
      #tray,
      #backlight,
      #custom-weeks 
      #workspaces button:hover,
      #workspaces button.urgent #workspaces button.focused,
      #workspaces button.active {
        padding: 0 8px;
        margin-left: 0;
        margin-right: 0;
        transition-duration: 0.3s;
        color: #89b4fa;
        text-shadow: 0 0 6px #89b4fa;
      }
    '';

  };
}

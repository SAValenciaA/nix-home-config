{programs, pkgs,  inputs, lib, ...}: {
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      font_family      = "jetbrains mono nerd font";
      font_size        = "11";
      bold_font        = "auto";
      italic_font      = "auto";
      bold_italic_font = "auto";
      mouse_hide_wait  = 2;
      cursor_shape     = "block";
      url_color        = "#70c070";
      url_style        = "straight";

      confirm_os_window_close = 0;
      background_opacity = "0.75";
      enable_audio_bell = false;
      draw_minimal_borders = false;
      window_margin_width = 0;
      window_padding_width = 0;
      bell_margin_width = 0;
      server_side_decorations = 0;
      
      active_tab_foreground   = "#222222";
      active_tab_background   = "#85fa89";
      active_tab_font_style   = "bold";
      inactive_tab_foreground = "#313244";
      inactive_tab_background = "#11111a";
      inactive_tab_font_style = "normal";

            # The 16 terminal colors

      # black
      color0 = "#222222" ;
      color8 = "#151515" ;
          
      # red              ;
      color1 = "#F38BA8" ;
      color9 = "#F38BA8" ;
         
      # green"           ;
      color10 = "#85FA89";
      color2  = "#4d8e4f";
           
      # yello ="w        ;
      color3  = "#bfbf33";
      color11 = "#fafa85";
            
      # blue  =          ;
      color4  = "#89B4FA";
      color12 = "#89B4FA";
             
      # magen ="ta       ;
      color5  = "#F5C2E7";
      color13 = "#F5C2E7";
              
      # cyan  =          ;
      color6  = "#94E2D5";
      color14 = "#94E2D5";
      # white ="         
      color7  = "#cccccc";
      color15 = "#cccccc";
  
    };
  };
}

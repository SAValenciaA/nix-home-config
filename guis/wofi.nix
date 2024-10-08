{programs, pkgs, inputs, lib, ...}: {

  
  programs.wofi = lib.mkForce {

    enable = true;
    settings =  {
      width = 400;
      height = 660;
      location = "top_right";
      xoffset = "-6";
      yoffset = "6";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      gtk_dark = true;
    };

    style = ''
      #window {
        background-color: rgba(0.4, 0.4, 0.4, 0.9);
        border: 2px solid #89b4fa;
        margin-right: 200px;
      }
       
      /*
      #outer-box {
        background-color: rgba(20, 20,20, 0.7);
        border: 1px solid #89b4fa;
      }*/
       
      #input {
        color: #cccccc;
        border: 1px solid rgba(100, 100, 100, 1);
        border-radius: 20px; 

        margin-left: 100px;
        margin-right: 100px;
        margin-top: 10px;
        margin-bottom: 20px;

        box-shadow: none;
        background-color: rgba(0.7, 0.7, 0.7, 0.9);
      }
       
      #input:focus {
        color: #999999;
        border: 1px solid #89b4fa;

        margin-left: 10px;
        margin-right: 10px;
        margin-top: 10px;
        margin-bottom: 20px;

        box-shadow: none;
        background-color: rgba(0.5, 0.5, 0.5, 0.9);
      }
       
      #entry {
        font-family: JetBrainsMono;
        border-radius: 20px;
        margin: 5px;
        margin-right: 20px;
        margin-left: 20px;
        padding-left: 10px;
        color: #cccccc;
      }
       
      #entry:focus {
        background: #89b4fa;
        box-shadow: 0 0 5px #89b4fa;
        border: 1px solid #89b4fa;
      }
      #text:selected {
        color: #222222;
      }
    '';
  };

}

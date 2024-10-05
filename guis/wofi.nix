{programs, pkgs, inputs, lib, ...}: {

  
  programs.wofi = lib.mkForce {

    enable = true;
    settings =  {
      width = 600;
      height = 350;
      location = "center";
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
      window {
        margin: 0px;
        background-color: #222222;
        border-radius: 0;
      }

      #input {
          padding: 4px;
          margin: 4px;
          padding-left: 20px;
          border: none;
          color: #cdd6f4;
          font-weight: bold;
          background-color: #222222;
          outline: none;
          border-radius: 15px;
          margin: 10px;
          margin-bottom: 2px;
      }
      #input:focus {
          border: 0px solid #1e1e2e;
          margin-bottom: 0px;
      }

      #inner-box {
          color: #cdd6f4;
          font-weight: bold;
          background-color: #222222;
          border-radius: 15px;
      }

      #outer-box {
          margin: 0px;
          border: none;
          border-radius: 15px;
          background-color: #222222;
      }

      #scroll {
          margin-top: 5px;
          border: none;
          border-radius: 15px;
          margin-bottom: 5px;
          /* background: rgb(255,255,255); */
      }

      #img:selected {
          border-radius: 15px;
          background-color: transparent;
      }

      #text:selected {
          color: #222222;
          margin: 0px 0px;
          border: none;
          border-radius: 15px;
          background-color: transparent;
      }

      #entry {
          margin: 0px 0px;
          border: none;
          border-radius: 15px;
          background-color: transparent;
      }

      #entry:selected {
          margin: 0px 0px;
          border: none;
          border-radius: 0;
          background-color: #85fa89;
      }
    '';
  };

}

{services, lib, pkgs,...} : {

  services.mako = {

    enable = true;
    sort="-time";
    layer="overlay";
    backgroundColor="#00000090";
    width=300;
    height=1010;
    padding="12";
    borderSize=2;
    borderColor="#111111";
    borderRadius=0;
    icons=true;
    iconPath=".icon/notify/";
    maxIconSize=100;
    defaultTimeout=5000;
    ignoreTimeout=true;
    font="JetBrainsMonoNL Nerd Font Propo";

    extraConfig = ''
      [urgency=low]
      on-notify=none
      text-color=#dddddd

      [urgency=normal]
      text-color=#89b4fa
      border-color=#89b4fa


      [urgency=high]
      border-size=3
      border-color=#FB5F50
      text-color=#FB5F50
      on-notify=exec mpv -volume=175 /usr/share/sounds/freedesktop/stereo/dialog-error.oga

      [category=mpd]
      default-timeout=2000
      group-by=category

      [category=headphonesConnected]
      border-color=#89b4fa
      text-color=#89b4fa

      [category=points]
      border-color=#c0bc70
      text-color=#c0bc70
      on-notify=exec mpv -volume=175 /usr/share/sounds/freedesktop/stereo/dialog-error.oga
    '';

  };

}

{programs, pkgs,  inputs, lib, ...}: {
  programs.zathura = lib.mkForce {
    enable = true;
    extraConfig = "set recolor true";
  };
}

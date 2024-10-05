{ config, pkgs, ... }:

{

  imports = [
    ./guis/default.nix
#    ./clis/default.nix
#    ./tuis/default.nix
#    ./bash.nix
  ];

  home.username = "valencia";
  home.homeDirectory = "/home/valencia";

  home.stateVersion = "24.05"; 

  home.packages = [
    pkgs.hello
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".bashrc".source = dotfiles/bashrc;

  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

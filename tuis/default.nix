{pkgs, lib, ...} : {
  imports = [
    ./lf.nix
    ./nvim.nix
#    ./htop.nix
#    ./ncdu.nix
#    ./tmux.nix
#    ./ttyper.nix
    ./starship.nix
  ];
}

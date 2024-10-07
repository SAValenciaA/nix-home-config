{pkgs, lib, ...} : {
  imports = [
    ./lf.nix
    ./nvim.nix
    ./tmux.nix
    ./starship.nix
  ];
}

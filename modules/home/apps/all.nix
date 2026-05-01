{ pkgs, ... }:

{
  imports = [
    ./some.nix
  ];

  home.packages = with pkgs; [
    # GUI applications
    google-chrome
    vscode
    distrobox
    distroshelf
  ];
}

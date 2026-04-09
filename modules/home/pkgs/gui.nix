{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI applications
    google-chrome
    vscode
    obs-studio
    dbeaver-bin
    distroshelf
    postman
  ];
}

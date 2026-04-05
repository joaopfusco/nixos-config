{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI applications
    vlc
    libreoffice
    alacarte
    obs-studio
    google-chrome
    vscode
    dbeaver-bin
    postman
    distroshelf
  ];
}

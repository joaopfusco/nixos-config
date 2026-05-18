{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    libreoffice
    google-chrome
    vscode
    obs-studio
    dbeaver-bin
    postman
  ];
}

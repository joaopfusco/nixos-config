{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI applications
    vlc
    libreoffice
    obs-studio
    dbeaver-bin
    postman
  ];
}

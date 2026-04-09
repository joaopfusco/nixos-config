{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI applications
    vlc
    libreoffice
    alacarte
    obs-studio
    google-chrome
    dbeaver-bin
    postman
    distroshelf
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}

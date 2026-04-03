{ config, pkgs, lib, username, ... }:

{
  imports = [
    ./modules/home
  ];

  # Enable the custom GNOME module
  features.gnome.enable = true;

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
}

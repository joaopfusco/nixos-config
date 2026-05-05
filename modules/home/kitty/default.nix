{ pkgs, ... }:
{
  imports = [ ./config.nix ];
  programs.kitty.package = pkgs.kitty;
}

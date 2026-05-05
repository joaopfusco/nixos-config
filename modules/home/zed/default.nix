{ pkgs, ... }:
{
  imports = [ ./config.nix ];
  programs.zed-editor.package = pkgs.zed-editor;
  # programs.zed-editor.package = pkgs.zed-editor-fhs;
}

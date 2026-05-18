{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    gnumake
    terraform
    azure-cli
    claude-code
    devenv
    uv
    nodejs
  ];
}

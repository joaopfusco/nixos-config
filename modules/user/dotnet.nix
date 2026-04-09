{ config, pkgs, ... }:

let
  dotnet-stack = (with pkgs.dotnetCorePackages; combinePackages [
    sdk_8_0
    sdk_9_0
  ]);
in
{
  home.packages = with pkgs; [
    dotnet-stack
    dotnet-ef
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${dotnet-stack}";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.dotnet/tools"
  ];
}
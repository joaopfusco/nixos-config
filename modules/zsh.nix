{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      cls = "clear";
      home-update = "home-manager switch --flake .#joaop";
      os-update = "sudo nixos-rebuild switch --flake .#$(hostname)";
      os-test = "sudo nixos-rebuild test --flake .#$(hostname)";
    };

    initContent = ''
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" ];
      theme = "robbyrussell";
    };
  };
}

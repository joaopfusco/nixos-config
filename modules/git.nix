{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = "joaopfusco";
        email = "joaopedrofusco@gmail.com";
      };
      credential = {
        helper = "store";
      };
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    forwardAgent = false;

    matchBlocks = {
      "github.com gitlab.com" = {
        identityFile = "~/.ssh/id_ed25519";
        user = "git";
      };
    };
  };

  services.ssh-agent.enable = true;
}
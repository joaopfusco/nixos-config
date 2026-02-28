{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = "joaopfusco";
        email = "joaopedrofusco@gmail.com";
      };
    };

    config = {
      credential.helper = "store";
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };

  services.ssh-agent.enable = true;
}
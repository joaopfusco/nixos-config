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
    startAgent = true;
  };
}
{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # homeStateVersion <= 25.11
    withRuby = false;
    withPython3 = false;
  };
}
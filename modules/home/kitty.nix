{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    
    settings = {
      shell = "${pkgs.zsh}/bin/zsh --login";

      # Window and Appearance
      window_padding_width = 15;
      confirm_os_window_close = 0;
      background_opacity = "0.95";
      hide_window_decorations = "yes";

      # Cursor and Scroll
      cursor_shape = "beam";
      cursor_blink_interval = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;

      # Performance Wayland
      input_delay = 3;
      repaint_delay = 10;

      # Ligatures
      disable_ligatures = "never";
      
      # URL Handling
      url_color = "#89b4fa";
      url_style = "curly";
      open_url_with = "default";
    };
  };
}
{ config, pkgs, ... }:

{
  import = [
    ./git.nix
    ./direnv.nix
    ./zsh.nix
    ./gnome.nix
  ];

  home.packages = with pkgs; [
    # System utilities
    fastfetch
    papirus-icon-theme

    # Nix tools
    home-manager
    nixfmt
    any-nix-shell

    # Python
    uv
    python312

    # Node
    nodejs_24

    # Go
    go_1_25
    gopls

    # Rust
    cargo
    rustc
    rustfmt
    clippy

    # Dev tools
    terraform
    azure-cli

    # GUI applications
    vlc
    libreoffice
    alacarte
    obs-studio
    google-chrome

    # Development GUI applications
    vscode
    dbeaver-bin
    postman 
  ];
}

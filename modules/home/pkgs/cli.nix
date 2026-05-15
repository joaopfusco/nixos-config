{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      # System utilities
      fastfetch

      # Nix tools
      home-manager
      nixfmt
      alejandra
      nixd
      nil
      statix

      # Node
      nodejs

      # Others
      uv
      gnumake
      terraform
      azure-cli
      claude-code
      devenv
    ]

    # Linux
    ++ lib.optionals stdenv.isLinux [

    ]

    # macOS (Darwin)
    ++ lib.optionals stdenv.isDarwin [

    ];
}

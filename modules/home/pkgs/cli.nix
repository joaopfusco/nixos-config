{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      fastfetch
      gnumake
      terraform
      azure-cli
      claude-code
      devenv
      uv
      nodejs
    ]

    # Linux
    ++ lib.optionals stdenv.isLinux [

    ]

    # macOS (Darwin)
    ++ lib.optionals stdenv.isDarwin [

    ];
}

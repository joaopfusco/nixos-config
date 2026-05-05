{ ... }:

{
  imports = [
    ../../modules/home/pkgs/cli.nix
    ../../modules/home/git.nix
    ../../modules/home/zsh.nix
    ../../modules/home/direnv.nix
    ../../modules/home/vim.nix
    ../../modules/home/dotnet/full.nix
    ../../modules/home/kitty/config.nix
    ../../modules/home/zed/config.nix
  ];
}

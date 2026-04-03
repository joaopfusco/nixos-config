{
  description = "NixOS System Configuration";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "joaop";
      hostNames = [ "nixos" "nixos-vm" ];

      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      # pkgs.pkg -> stable
      # pkgs.unstable.pkg -> unstable
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ overlay-unstable ];
      };
    in {
      nixosConfigurations = nixpkgs.lib.genAttrs hostNames (host:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit host username inputs; };
          modules = [
            { 
              nixpkgs.pkgs = pkgs;
              nix.registry.unstable.flake = nixpkgs-unstable; # nix shell unstable#pkg
              nix.registry.nixpkgs.flake = nixpkgs; # nix shell nixpkgs#pkg
            }
            ./hosts/${host}/hardware-configuration.nix
            ./hosts/${host}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit username inputs; };
              home-manager.users.${username} = import ./home.nix;
            }
          ];
        }
      );
      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit username inputs; };
        modules = [ ./home.nix ];
      };
    };
}
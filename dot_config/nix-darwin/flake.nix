{
  description = "Marmos91 Darwin configuration";

  inputs = {
    # Where we get most of our software. Giant mono repo with recipes
    # called derivations that say how to build software.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Controls system level software and settings including fonts
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Controls Homebrew 
    homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # Manages configs links things into your home directory
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, darwin, nixpkgs, home-manager, homebrew }: {
    darwinConfigurations.Marcos-MacBook-Pro = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        config.allowUnfree = true;
      };
      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.marmos91.imports = [ ./modules/home-manager ];
          };
        }
      ];
    };
  };
}

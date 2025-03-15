{
  description = "home-manager flake for nonoproto desktop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    plasma-manager,
    ...
  } @ inputs: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    homeConfigurations."nonproto" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        inputs.plasma-manager.homeManagerModules.plasma-manager
        ./home.nix
        ./modules
      ];
    };
  };
}

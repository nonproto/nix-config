{
  description = "nonproto system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @inputs: {    
   nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
     specialArgs = { inherit inputs; };
     modules = [
      ./hosts/desktop/configuration.nix
      ./modules
    
    ];
  };
};
}

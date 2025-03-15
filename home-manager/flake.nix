{
  description = "home-manager flake for nonoproto desktop";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };  

  };
  
  outputs = { nixpkgs, home-manager, ... }@inputs:

  let pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
    
  in {
      homeConfigurations."nonproto" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        

	modules = [ 
          ./home.nix 
          ./modules
        ];

      };
  };

}

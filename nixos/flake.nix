{
  description = "My NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {

    nixosConfigurations = { 
      pc = nixpkgs.lib.nixosSystem {      
        system = "x86_64-linux";      
	specialArgs = { inherit inputs; };
        modules = [ ./hosts/pc/configuration.nix ];
      };

      gpd = nixpkgs.lib.nixosSystem {      
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
        modules = [ ./hosts/gpd/configuration.nix ];
      };    

      lenovo = nixpkgs.lib.nixosSystem {      
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
        modules = [ ./hosts/lenovo/configuration.nix ];
      }; 
    };

  };
}

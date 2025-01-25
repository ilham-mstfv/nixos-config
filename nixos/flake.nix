{
  description = "My NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    vars = {
      user = "ilham";
    };
  in
  {
    nixosConfigurations = { 
      pc = nixpkgs.lib.nixosSystem {      
        specialArgs = { inherit self inputs system vars; }; 
        modules = [ ./hosts/pc/configuration.nix ];
      };

      gpd = nixpkgs.lib.nixosSystem {      
        specialArgs = { inherit self inputs system vars; }; 
        modules = [ ./hosts/gpd/configuration.nix ];
      };    

      lenovo = nixpkgs.lib.nixosSystem {      
        specialArgs = { inherit self inputs system vars; }; 
        modules = [ ./hosts/lenovo/configuration.nix ];
      }; 
    };
  };
}

{
  description = "My NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    vars = {
      user = "ilham";
    };
  in
  {
    nixosConfigurations = { 
      pc = nixpkgs.lib.nixosSystem {      
        inherit system;
        specialArgs = { inherit self inputs system vars; }; 
        modules = [ ./hosts/pc/configuration.nix ];
      };

      gpd = nixpkgs.lib.nixosSystem {      
        inherit system;
        specialArgs = { inherit self inputs system vars; }; 
        modules = [ ./hosts/gpd/configuration.nix ];
      };    

      lenovo = nixpkgs.lib.nixosSystem {      
        inherit system;
        specialArgs = { inherit self inputs system vars; }; 
        modules = [ ./hosts/lenovo/configuration.nix ];
      }; 
    };

    homeConfigurations = {
      "${vars.user}@pc" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/pc/home.nix ];
        extraSpecialArgs = { inherit self inputs system vars; };
      };

      "${vars.user}@gpd" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/gpd/home.nix ];
        extraSpecialArgs = { inherit self inputs system vars; };
      };

      "${vars.user}@lenovo" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/lenovo/home.nix ];
        extraSpecialArgs = { inherit self inputs system vars; };
      };
    };
  };
}

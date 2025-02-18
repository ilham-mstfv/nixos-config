{ pkgs, config, libs, vars, ... }:

{
  ### Allow unfree packages ###
  nixpkgs.config.allowUnfree = true;


  ### Experimental features ###
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  ### Optimise store on each rebuild ###
  nix.settings.auto-optimise-store = true;


  ### Automatic Nix Garbage Collector ### Disabled due to Nix Helper
  nix.gc = {
    automatic = false;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  
  ### Nix Helper ###
  programs.nh = {
    enable = true;
    flake = "/home/${vars.user}/nixos-config";

    clean = 
    { # Garbage Collector
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 7d";
    };    
  };
}

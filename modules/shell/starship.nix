{ pkgs, config, libs, ... }:

{
  ### Starship Settings ###
  programs.starship = {
    enable = true;
    package = pkgs.starship;

    presets = [ ];

    settings = { };
  };
}

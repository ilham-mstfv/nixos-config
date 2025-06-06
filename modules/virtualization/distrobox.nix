{ pkgs, libs, vars, ... }:

{
  ### DistroBox ###
  imports = [
    ./podman.nix
  ];

  environment.systemPackages = with pkgs; [ distrobox ];
}

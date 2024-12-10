{ pkgs, libs, ... }:

{
  ### Enable auto scrub for btrfs ###
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };
}

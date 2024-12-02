{ pkgs, libs, ... }:

{
  ### Docker ###
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;
  users.extraGroups.docker.members = [ "ilham" ]; # Write here your username.
  virtualisation.docker.storageDriver = "btrfs"; # If you use btrfs.
  
  virtualisation.docker.daemon.settings = 
  { # Store all docker's data in this location.
    data-root = "/mnt/homedisk/Code/Docker/Files";
  };
}

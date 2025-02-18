{ pkgs, libs, vars, ... }:

{
  ### Docker ###
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false;
      storageDriver = "btrfs"; # If you use btrfs.

      daemon.settings = 
      { # Store all docker's data in this location.
        data-root = "/mnt/homedisk/Code/Docker/Files";
      };
    };
  };

  ## Write here your username ##
  users.extraGroups.docker.members = [ "${vars.user}" ];   

  ## Install some packages ##
  environment.systemPackages = with pkgs; [ docker docker-compose ];
}

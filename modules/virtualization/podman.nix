{ pkgs, libs, vars, ... }:

{
  ### Podman ###
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = false;

      defaultNetwork.settings.dns_enabled = true;
    };
  };

  ## Write here your username ##
  users.extraGroups.podman.members = [ "${vars.user}" ];   

  ## Install some packages ##
  environment.systemPackages = with pkgs; [ 
    podman podman-tui podman-compose
    dive
  ];
}

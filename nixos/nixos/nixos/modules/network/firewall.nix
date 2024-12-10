{ pkgs, config, libs, ... }:

{
  ### Firewall settings. ###
  networking.firewall.allowedTCPPorts = [ 
    22000  32857 # Syncthing TCP ports 
  ];
  networking.firewall.allowedUDPPorts = [ 
    22000  32857 # Syncthing UDP ports
  ];
  
  # Disable the firewall altogether. Not recommended.
  # networking.firewall.enable = false;
}

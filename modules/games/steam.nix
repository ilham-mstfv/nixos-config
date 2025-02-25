{ pkgs, config, libs, ...}:

{
  programs = {

    ### Steam ###
    steam = {
      
      ## Install and Enable ##
      enable = true;
 
      ## Open Firewall for remote play ##
      remotePlay.openFirewall = true;

      ## Open Firewall for dedicated Server ##
      dedicatedServer.openFirewall = true;

      ## Open Firewall for local network games ##
      localNetworkGameTransfers.openFirewall = true;

      ## Gamescope Session ##
      gamescopeSession.enable = true;

      ## Protontricks ##
      protontricks.enable = true;
    };

    ### Gamescope Session ###
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };

  ### Hardware features for Steam ### For example Controller support
  hardware.steam-hardware.enable = true;

  ### Install some useful packages ###
  environment.systemPackages = with pkgs; [
    steam-tui    
  ];
}

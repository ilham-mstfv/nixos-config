{ pkgs, config, libs, ... }:

{
  ### Plasma Session Settings ###
  ### Better use SDDM with Plasma ###
  ### ./modules/desktop/sddm.nix ###

  ## X11 windowing system ## Can be disabled ##
  services.xserver.enable = true;


  ## KDE Plasma6 session ##
  services.desktopManager = {
    plasma6 = {
      # Enable Plasma 6 ##
      enable = true;

      # Disable for full QT6 ##
      enableQt5Integration = true; 
    }; 
  };
}

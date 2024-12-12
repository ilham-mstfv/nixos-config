{ pkgs, config, libs, ... }:

{
  ### SDDM Display Manager Settings ###

  ## X11 windowing system ## Can be disabled ##
  services.xserver.enable = true;

  ## SDDM settings ##
  services.displayManager = {
    sddm = { 
      ## Enable SDDM ## 
      enable = true;

      ## Wayland Support ##
      wayland.enable = true;

      ## Enable hiDpi support ##
      enableHidpi = true;

      ## Theme Settings ## 
      theme = "${pkgs.catppuccin-sddm-corners}/share/sddm/themes";
    };
  };
}

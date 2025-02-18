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
      wayland.enable = false;

      ## Enable hiDpi support ##
      enableHidpi = false;
    };
  };

  ## Theme Settings ##
  #services.displayManager.sddm.theme = "sddm-astronaut-theme";
  
  environment.systemPackages = [
    /*
    # https://github.com/Keyitdev/sddm-astronaut-theme/blob/master/theme.conf
    pkgs.sddm-astronaut
    (pkgs.writeTextDir "share/sddm/themes/sddm-astronaut-theme/theme.conf.user" ''
      [General]
      # background= /folder/file.png
      FullBlur="false"
      PartialBlur="true"
      FormPosition="center"
    '')
    */
  ];
  
}

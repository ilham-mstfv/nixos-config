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
    };
  };

  ## Theme Settings ##
  services.displayManager.sddm.theme = "sddm-astronaut-theme";
  
  environment.systemPackages = [
    # https://github.com/Keyitdev/sddm-astronaut-theme/blob/master/theme.conf
    # It is possible to override the package and set themeConfig. For now, I will iterate like this.
    pkgs.sddm-astronaut
    (pkgs.writeTextDir "share/sddm/themes/sddm-astronaut-theme/theme.conf.user" ''
      [General]
      # background= /folder/file.png
      FullBlur="false"
      PartialBlur="true"
      FormPosition="center"
    '')
  ];
  
}

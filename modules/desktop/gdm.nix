{ pkgs, config, libs, ... }:

{
  ### GDM Display Manager Settings ###

  ## X11 windowing system ##
  services.xserver.enable = true;

  ## GDM settings ##
  services.displayManager = {
    gdm = { 
      ## Enable GDM ## 
      enable = true;

      ## Wayland Support ##
      wayland = true;

      ## AutoSuspend ##
      autoSuspend = true;
    };
  };
}

{ pkgs, config, libs, ... }:

{
  ### Plasma Session Settings ###
  # X11 windowing system. Can be disabled if only Wayland.
  services.xserver.enable = true;

  # SDDM settings.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = false; # Enable this if you use only Wayland
  # services.displayManager.sddm.enableHidpi = true; # I don't know what is this, but it can be useful.

  # KDE Plasma session.
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.plasma6.enableQt5Integration = true; # Disable for full QT6

  # Default session.
  # services.displayManager.defaultSession = "plasma"; # May be pointless
}

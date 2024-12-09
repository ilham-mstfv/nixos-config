{ pkgs, config, libs, ... }:

{
  ### Gnome Session Settings ###
  ### Better use gdm with Gnome ###
  ### ./modules/desktop/gdm.nix ###

  # X11 windowing system. Can be disabled if only Wayland.
  services.xserver.enable = true;

  ## Enable Gnome
  services.xserver.desktopManager = {
    gnome = {
      enable = true;
    };
  };


  ## Enable gnome-settings-daemon udev rules ##
  # services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];


  ## Automatic screen rotation ##
  # hardware.sensor.iio.enable = false;


  ## Install some packages ##
  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
 
    gnomeExtensions.appindicator 
  ];

  ## Set a profile picture use command ##
  ## $ mv /path/to/image.jpg ~/.face ##
}

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

    gparted

    pkgs.adwaita-icon-theme 
 
    gnomeExtensions.appindicator 
    gnomeExtensions.blur-my-shell 
    gnomeExtensions.dynamic-panel

    gnomeExtensions.arcmenu
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.removable-drive-menu
    gnomeExtensions.vitals
    gnomeExtensions.dock-from-dash
    gnomeExtensions.sound-output-device-chooser
  ];

  ## Set a profile picture use command ##
  ## $ mv /path/to/image.jpg ~/.face ##
}

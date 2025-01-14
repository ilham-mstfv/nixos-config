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
  environment.systemPackages = (with pkgs; [
    gnome-tweaks
    gparted    
    adwaita-icon-theme 

  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator 
    blur-my-shell 
    dynamic-panel 
    arcmenu
    caffeine
    clipboard-indicator
    removable-drive-menu
    vitals
    dock-from-dash
    sound-output-device-chooser
    battery-health-charging
    ideapad
    pop-shell   
    better-desktop-zoom
  ]);


  ## Set a profile picture use command ##
  ## $ mv /path/to/image.jpg ~/.face ##
}

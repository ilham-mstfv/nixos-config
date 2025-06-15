{ pkgs, config, libs, ... }:

{
  ### Gnome Session Settings ###
  ### Better use gdm with Gnome ###
  ### ./modules/desktop/gdm.nix ###

  # X11 windowing system. Can be disabled if only Wayland.
  services.xserver.enable = true;

  ## Enable Gnome
  services.desktopManager = {
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
    dash-to-dock
    sound-output-device-chooser
    battery-health-charging
    ideapad
    pop-shell   
    better-desktop-zoom
    quick-settings-tweaker
    privacy-settings-menu
    logo-menu
    top-bar-organizer
    dash2dock-lite
    compiz-alike-magic-lamp-effect
    forge
    user-themes
    just-perfection
    quick-settings-tweaker
    desktop-cube
    gsconnect
    applications-menu
    openweather-refined
    open-bar
    media-controls
  ]);


  ## Set a profile picture use command ##
  ## $ mv /path/to/image.jpg ~/.face ##
}

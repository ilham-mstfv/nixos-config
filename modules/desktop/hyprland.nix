{ pkgs, config, libs, ... }:

{ ## Hyprland Desktop Settings ##
  ## https://wiki.hyprland.org ##
  ## https://wiki.nixos.org/wiki/Hyprland ##

  programs.hyprland = {

    ## Enable Hyprland ##
    enable = true;

    ## Universal Wayland Session Manager ##
    withUWSM = true;

    ## Xwayland. Default: True ##
    xwayland.enable = true;
  };


  ## Hyprland's idle daemon ##
  services.hypridle.enable = true;

  ## Hyprlock with GPU-acceliration ##
  programs.hyprlock.enable = true;

  ## Enable UWSM ##
  programs.uwsm.enable = true;


  ## Install Some Packages ##
  environment.systemPackages = with pkgs; [

    ## Wallpapers ##
    hyprpaper

    ## Blue-light filter ##
    hyprsunset

    ## Wayland color picker ##
    hyprpicker

    ## Hyrpland Cursor ##
    hyprcursor

    ## Polkit authentication agent ##
    hyprpolkitagent

    ## Terminal ##
    kitty

    ## Status Bar ##
    waybar

    ## App Menu ##
    wofi
    rofi
  ];
}

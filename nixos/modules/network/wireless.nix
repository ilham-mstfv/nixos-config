{ pkgs, config, libs, ... }:

{ ### Wireless support via wpa_supplicant ###
  networking.wireless.enable = false;
}

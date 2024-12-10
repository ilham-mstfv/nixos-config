{ pkgs, libs, ... }:

{
  # Bluetooth settings
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = false; # App for configuring bluetooth.
}

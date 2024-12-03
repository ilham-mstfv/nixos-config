{ pkgs, config, libs, ... }:

{
  ### Bootloader ###
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 7;

  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    useOSProber = true;
  };

  boot.kernelParams = [
    "splash"
    "quiet"
  ];
}

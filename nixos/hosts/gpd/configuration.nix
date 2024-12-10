# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ## Bootloader settings ##
      ../../modules/bootloader/grub.nix

      ## NixOS general settings ##
      ../../modules/nix/settings.nix

      ## Linux Kernel settings ##
      ../../modules/hardware/kernel.nix


      ## Hardware ##
        # Nvidia 
      #../../modules/hardware/nvidia.nix

        # Zram 
      ../../modules/hardware/zram.nix

        # Ntfs support 
      ../../modules/hardware/ntfs.nix

        # Bluetooth 
      ../../modules/hardware/bluetooth.nix

        # Sound settings 
      ../../modules/hardware/sound.nix


      ## User settings ##
      ../../modules/users/main.nix


      ## Network settings ##
      ../../modules/network/firewall.nix
      ../../modules/network/wireless.nix
      ../../modules/network/dns.nix
      ../../modules/network/proxy.nix


      ## Desktop Settings ##
        # Plasma Desktop 
      ../../modules/desktop/plasma.nix
      ../../modules/desktop/sddm.nix

        # Gnome Desktop 
      #../../modules/desktop/gnome.nix
      #../../modules/desktop/gdm.nix


      # Shell settings
      ../../modules/shell/zsh.nix
      #../../modules/shell/kmscon.nix
      ../../modules/shell/shellAliases.nix

      ## Fonts ##
      ../../modules/fonts/settings.nix


      ## Programs ##
      ../../modules/programs/common.nix


      ## Steam and games settings ##
      ../../modules/games/common.nix


      ## Virtualization ##
      #../../modules/virtualization/virtualbox.nix
      #../../modules/virtualization/qemu.nix
      #../../modules/virtualization/docker.nix


      ## Services ##
        # Btrfs auto scrub #
      #../../modules/services/btrfs-auto-scrub.nix

        # Mount service #
      ../../modules/services/mount-disk.nix

        # Alsamixer settings #
      #../../modules/services/alsamixer-settings.nix
    ];

  ## Overrides ##
  boot.loader.timeout = lib.mkForce 2;

  #services.displayManager.sddm.enableHidpi = lib.mkForce false;
  #services.displayManager.sddm.wayland.enable = lib.mkForce false;


  ### Network ###
  # Hostname
  networking.hostName = "gpd";

  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Asia/Baku";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  environment.systemPackages = with pkgs; [
    
  ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

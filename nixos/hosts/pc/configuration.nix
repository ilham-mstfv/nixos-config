# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ ## Include the results of the hardware scan ##
      ./hardware-configuration.nix

      ## Bootloader settings ##
      ../../modules/nixos/bootloader/grub.nix

      ## NixOS general settings ##
      ../../modules/nixos/nix/settings.nix

      ## Linux Kernel settings ##
      ../../modules/nixos/hardware/kernel.nix


      ## Hardware ## 
        # Nvidia 
      ../../modules/nixos/hardware/nvidia.nix

        # Zram 
      ../../modules/nixos/hardware/zram.nix

        # Ntfs support 
      ../../modules/nixos/hardware/ntfs.nix
     
        # Bluetooth 
      ../../modules/nixos/hardware/bluetooth.nix

        # Sound settings 
      ../../modules/nixos/hardware/sound.nix


      ## User settings ##
      ../../modules/nixos/users/main.nix


      ## Network settings ##
      ../../modules/nixos/network/firewall.nix
      ../../modules/nixos/network/wireless.nix
      ../../modules/nixos/network/dns.nix
      ../../modules/nixos/network/proxy.nix


      ## Desktop Settings ##
        # Plasma Desktop 
      ../../modules/nixos/desktop/plasma.nix
      ../../modules/nixos/desktop/sddm.nix

        # Gnome Desktop 
      #../../modules/nixos/desktop/gnome.nix
      #../../modules/nixos/desktop/gdm.nix

        # Hyprland Desktop
      #../../modules/nixos/desktop/hyprland.nix


      # Shell settings
      ../../modules/nixos/shell/zsh.nix
      #../../modules/nixos/shell/kmscon.nix
      ../../modules/nixos/shell/shellAliases.nix

      ## Fonts ##
      ../../modules/nixos/fonts/settings.nix

      ## Locales ##
      #../../modules/nixos/locales/en-us.nix
      ../../modules/nixos/locales/ru-ru.nix
      #../../modules/nixos/locales/us-keymap.nix
      #../../modules/nixos/locales/ru-keymap.nix
      ../../modules/nixos/locales/baku-timeZone.nix

      
      ## Programs ##
      ../../modules/nixos/programs/common.nix


      ## Games ##
      ../../modules/nixos/games/common.nix


      ## Virtualization ##
      ../../modules/nixos/virtualization/virtualbox.nix
      ../../modules/nixos/virtualization/qemu.nix
      ../../modules/nixos/virtualization/docker.nix
      #../../modules/nixos/virtualization/waydroid.nix

      ## Services ##
        # Btrfs auto scrub #
      ../../modules/nixos/services/btrfs-auto-scrub.nix

        # Mount service #
      ../../modules/nixos/services/mount-disk.nix

        # Alsamixer settings #
      ../../modules/nixos/services/alsamixer-settings.nix

    ];



  ### Network ###
  # Hostname.
  networking.hostName = "pc";

  # Enable network manager
  networking.networkmanager.enable = true;


  # List packages installed in system profile
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

{ config, pkgs, ... }:

{
  imports =
    [ ## Include the results of the hardware scan ##
      ./hardware-configuration.nix

      ## Bootloader settings ##
      ../../modules/bootloader/grub.nix

      ## NixOS general settings ##
      ../../modules/nix/settings.nix

      ## Linux Kernel settings ##
      ../../modules/hardware/kernel.nix


      ## Hardware ## 
        # Nvidia 
      ../../modules/hardware/nvidia.nix
      ../../modules/hardware/nvidiaPowerMizer.nix

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

        # Hyprland Desktop
      #../../modules/desktop/hyprland.nix


      # Shell settings
      ../../modules/shell/zsh.nix
      #../../modules/shell/kmscon.nix
      ../../modules/shell/shellAliases.nix

      ## Fonts ##
      ../../modules/fonts/settings.nix

      ## Locales ##
      #../../modules/locales/en-us.nix
      ../../modules/locales/ru-ru.nix
      #../../modules/locales/us-keymap.nix
      #../../modules/locales/ru-keymap.nix
      ../../modules/locales/baku-timeZone.nix

      
      ## Programs ##
      ../../modules/programs/common.nix


      ## Games ##
      ../../modules/games/common.nix


      ## Virtualization ##
      ../../modules/virtualization/virtualbox.nix
      ../../modules/virtualization/qemu.nix
      ../../modules/virtualization/docker.nix
      #../../modules/virtualization/waydroid.nix

      ## Services ##
        # Btrfs auto scrub #
      ../../modules/services/btrfs-auto-scrub.nix

        # Mount service #
      ../../modules/services/mount-disk.nix

        # Alsamixer settings #
      ../../modules/services/alsamixer-settings.nix

    ];



  ### Network ###
  # Hostname.
  networking.hostName = "pc";

  # Enable network manager
  networking.networkmanager.enable = true;


  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    
  ];


  ## Don't change this value ##
  system.stateVersion = "24.05";
}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, system, vars, ... }:

{
  imports =
    [ ## Include the results of the hardware scan ##
      ./hardware-configuration.nix

      ## Home Manager ##
      inputs.home-manager.nixosModules.default

      ## Bootloader settings ##
      ../../modules/nixos/bootloader/grub.nix

      ## NixOS general settings ##
      ../../modules/nixos/nix/settings.nix

      ## Linux Kernel settings ##
      ../../modules/nixos/hardware/kernel.nix


      ## Hardware ##
        # Nvidia 
      #../../modules/nixos/hardware/nvidia.nix

        # Logitech
      #../../modules/nixos/hardware/logitech.nix

        # Zram 
      ../../modules/nixos/hardware/zram.nix

        # Ntfs support 
      ../../modules/nixos/hardware/ntfs.nix

        # Bluetooth 
      #../../modules/nixos/hardware/bluetooth.nix

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
      #../../modules/nixos/desktop/plasma.nix
      #../../modules/nixos/desktop/sddm.nix

        # Gnome Desktop 
      ../../modules/nixos/desktop/gnome.nix
      ../../modules/nixos/desktop/gdm.nix


      ## Shell settings ##
      ../../modules/nixos/shell/zsh.nix
      #../../modules/nixos/shell/kmscon.nix
      #../../modules/nixos/shell/shellAliases.nix

      ## Fonts ##
      ../../modules/nixos/fonts/settings.nix

      ## Locales ##
      #../../modules/nixos/locales/en-us.nix
      ../../modules/nixos/locales/ru-ru.nix
      #../../modules/nixos/locales/us-keymap.nix
      ../../modules/nixos/locales/ru-keymap.nix
      ../../modules/nixos/locales/baku-timeZone.nix


      ## Programs ##
      ../../modules/nixos/programs/common.nix


      ## Steam and games settings ##
      #../../modules/nixos/games/common.nix


      ## Virtualization ##
      #../../modules/nixos/virtualization/virtualbox.nix
      #../../modules/nixos/virtualization/qemu.nix
      ../../modules/nixos/virtualization/docker.nix


      ## Services ##
        # Btrfs auto scrub #
      #../../modules/nixos/services/btrfs-auto-scrub.nix

        # Mount service #
      ../../modules/nixos/services/mount-disk.nix

        # Tlp service #
      #../../modules/nixos/services/tlp.nix

        # Alsamixer settings #
      #../../modules/nixos/services/alsamixer-settings.nix

        # Wakeup Fix for GPD #
      #../../modules/nixos/services/wakeup-service.nix
    ];

  ## Overrides ##
  programs.nh = {
    enable = lib.mkForce true;
    flake = lib.mkForce "/home/ilham/nixos-configuration/nixos";
  };

  boot.loader.timeout = lib.mkForce 2;


  ## Home Manager ##
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs system vars; };
    users.${vars.user} = import ./home.nix;
  };


  ## Networking ##
  networking.hostName = "lenovo"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

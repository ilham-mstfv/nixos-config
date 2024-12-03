# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Bootloader (grub/systemd-boot)
      ../../modules/bootloader/bootloader.nix

      # NixOS general settings
      ../../modules/nix/settings.nix

      # Linux Kernel settings
      ../../modules/hardware/kernel.nix


      # Nvidia settings.
      ../../modules/hardware/nvidia.nix

      # Zram
      ../../modules/hardware/zram.nix

      # Alsamixer settings
      ../../modules/hardware/alsamixer-settings.nix

      # Ntfs support
      ../../modules/hardware/ntfs.nix
     
      # Bluetooth
      ../../modules/hardware/bluetooth.nix

      
      # Shell settings
      ../../modules/shell/zsh.nix
      ../../modules/shell/kmscon.nix


      # Network settings
      ../../modules/network/firewall.nix
      ../../modules/network/wireless.nix
      ../../modules/network/dns.nix
      ../../modules/network/proxy.nix


      # Desktop Settings
      ../../modules/desktop/plasma.nix

      # Fonts
      ../../modules/fonts/settings.nix

      
      # Programs
      ../../modules/programs/common.nix


      # Steam and games settings.
      ../../modules/games/games.nix


      # VirtualBox
      ../../modules/virtualization/virtualbox.nix

      # Docker
      ../../modules/virtualization/docker.nix


      # Btrfs auto scrub
      ../../modules/services/btrfs-auto-scrub.nix

      # Mount service
      ../../modules/services/mount-disk.nix
    ];



  ### Network ###
  # Hostname.
  networking.hostName = "pc";

  # Enable network manager
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Asia/Baku";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "ru";
    variant = "";
  };
  

  ### Sound Settings ###
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    
    # media-session.enable = true;
    wireplumber.enable = true;
  };


  ### User account and user packages ### Set a password with ‘passwd’.
  users.users.ilham = {
    isNormalUser = true;
    description = "ilham";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.plasma-systemmonitor
      kdePackages.yakuake
      kdePackages.filelight
      # thunderbird
    ];
  };


  # List packages installed in system profile. To search: $ nix search wget
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

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Nvidia settings.
      ./nvidia.nix

      # Steam and games settings.
      ./games.nix
    ];
 

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


  ### Automatic Nix Garbage Collector ###
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };


  ### Allow unfree packages ###
  nixpkgs.config.allowUnfree = true;


  ### Experimental features ###
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  
  ### Nix Helper ###
  programs.nh = {
    enable = true;
    # clean.enable = true;
    # clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos";
  };  


  ### Linux kernel ###
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;


  ### Enable zram options ###
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 30;
  };


  ### Enable auto scrub for btrfs ###
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };


  ### Enable NTFS file system ###
  boot.supportedFilesystems = [ "ntfs" ];


  ### Change owner of /mnt/homedisk. Temp solution. ###
  systemd.services.changeOwnerHomedisk = {
    description = "Change owner of /mnt/homedisk";
    wantedBy = [ "multi-user.target" ];
    after = [ "local-fs.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.coreutils}/bin/chown -R ilham:1000 /mnt/homedisk";
      # RemainAfterExit = true;
    };
  };  


  ### Network ###
  # Hostname.
  networking.hostName = "pc";

  # Wireless support via wpa_supplicant.
  # networking.wireless.enable = true;

  # Configure DNS servers
  # networking.nameservers = [ "dns.adguard.com" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable network manager
  networking.networkmanager.enable = true;

  # Bluetooth settings
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = false; # App for configuring bluetooth.


  ### VirtualBox ###
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "ilham" ];
  
  # Enable VBox Quest Additions
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.dragAndDrop = true;
  # virtualisation.virtualbox.guest.clipboard = true;
  # virtualisation.virtualbox.guest.seamless = true;
  # virtualisation.virtualbox.host.enableKvm = true;


  ### Docker ###
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;
  users.extraGroups.docker.members = [ "ilham" ]; # Write here your username.
  virtualisation.docker.storageDriver = "btrfs"; # If you use btrfs.
  
  virtualisation.docker.daemon.settings = 
  { # Store all docker's data in this location.
    data-root = "/mnt/homedisk/Code/Docker/Files";
  };


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


  ### Graphical Session Settings ###
  # X11 windowing system. Can be disabled if only Wayland.
  services.xserver.enable = true;

  # SDDM settings.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = false; # Enable this if you use only Wayland
  # services.displayManager.sddm.enableHidpi = true; # I don't know what is this, but it can be useful.

  # KDE Plasma session.
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.plasma6.enableQt5Integration = true; # Disable for full QT6

  # Default session.
  # services.displayManager.defaultSession = "plasma"; # May be pointless


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "ru";
    variant = "";
  };


  ### Enable zsh ###
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      ff = "fastfetch";

      update = ''
        sudo nixos-rebuild switch --flake /etc/nixos#pc
      '';

      upgrade = ''
        sudo nix flake update --flake /etc/nixos &&
        sudo nixos-rebuild switch --upgrade --flake /etc/nixos#pc
      '';

      ## GIT ##
      save-config = ''
        cp -r /etc/nixos/. /mnt/homedisk/Code/Git/nixos-configuration/nixos/ && 
        cd /mnt/homedisk/Code/Git/nixos-configuration/ && 
        git add . && 
        git commit -m "Update configuration" && 
        git push &&
        cd
      '';
      
      save-new-config = ''
        rm -r /mnt/homedisk/Code/Git/nixos-configuration/nixos/ &&
        mkdir /mnt/homedisk/Code/Git/nixos-configuration/nixos/ &&
        save-config
      '';

      ## GPD ##
      # save-config-gpd = ''
      #   cp -r /etc/nixos/. /mnt/homedisk/Code/Git/nixos-configuration/hosts/gpd/ && 
      #   cd /mnt/homedisk/Code/Git/nixos-configuration/ && 
      #   git add . && 
      #   git commit -m "Update gpd configuration" && 
      #   git push &&
      #   cd
      # ''; 
      # 
      # save-new-config-gpd = ''
      #   rm -r /mnt/homedisk/Code/Git/nixos-configuration/hosts/gpd/ &&
      #   mkdir /mnt/homedisk/Code/Git/nixos-configuration/hosts/gpd/ &&
      #   save-config-gpd
      # '';
    };

    ohMyZsh = {
      enable = true;
      # theme = "arrow";
      # plugins = [ "git" ];
    };
     
    promptInit = 
      "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    histSize = 2000;
    histFile = "$HOME/.zsh_history";
  };

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  

  # Better linux console 
  # services.kmscon.enable = true;


  ### Sound Settings ###
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    
    # media-session.enable = true;
    wireplumber.enable = true;
  };


  ### Alsamixer Stable Settings ###  Disable if on Unstable.
  # sound.enable = true;
  # sound.extraConfig = ''
    # Saving alsamixer settings
    # load-module module-alsa-sink
    # load-module module-alsa-source

    # Disabling Auto-Mute Mode
    # options snd-hda-intel model=pch
    # options snd-hda-intel auto_mute=0
  # '';
  
  ### Alsamixer Unstable Settings ### Disable in on Stable.
  hardware.alsa.enablePersistence = true;


  ### Enable touchpad support ### (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


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


  ### Font settings. ###  
  fonts = {
    # Enable default Fonts.
    enableDefaultPackages = true;
  };

  
  # Install firefox.
  programs.firefox.enable = true;

  # Install chromium
  programs.chromium.enable = true;

  # Install java
  programs.java = {
    enable = true;
    package = pkgs.jdk23;
  };

  # Install obs-studio
  programs.obs-studio.enable = true;

  # Enable syncthing
  services.syncthing.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable git
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
  };


  # List packages installed in system profile. To search: $ nix search wget
  environment.systemPackages = with pkgs; [

    ## System ##
    vim
    neovim
    wget
    fd
    vlc
    alsa-utils
    syncthing
    zsh-powerlevel10k
    fastfetch
    python3Full


    ## Internet ##
    floorp
    chromium
    telegram-desktop
    qbittorrent-enhanced


    ## Developing ##
    docker
    docker-compose
    jetbrains.idea-ultimate
    jetbrains.pycharm-community

    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; 
      [ # Write your VSCode extensions here.
        jnoortheen.nix-ide
        vscjava.vscode-java-pack
      ];
    })
 
   
    ## Office ##
    libreoffice-qt6


    ## Other ##
    ventoy-full
    obsidian
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  ### Enable the OpenSSH daemon. ###
  # services.openssh.enable = true;

  ### Firewall settings. ###
  networking.firewall.allowedTCPPorts = [ 
    22000  32857 # Syncthing TCP ports 
  ];
  networking.firewall.allowedUDPPorts = [ 
    22000  32857 # Syncthing UDP ports
  ];
  
  # Disable the firewall altogether. Not recommended.
  # networking.firewall.enable = false;



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

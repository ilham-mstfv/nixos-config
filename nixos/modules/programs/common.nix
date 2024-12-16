{ pkgs, config, libs, ... }:

{
  
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
  services.syncthing = {
    enable = true;
  };

  # The Fuck Service
  programs.thefuck = {
    enable = true;
    alias = "fuck";
  };

  # Enable Neovim
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable git
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
  };


  # List packages installed in system profile. To search: $ nix search wget
  environment.systemPackages = with pkgs; [

    ## CLI Tools ##
    wget
    fd
    zip
    syncthing
    fastfetch
    python3Full
    # cava

    
    ## Multimedia ##
    vlc


    ## Internet ##
    floorp
    chromium
    telegram-desktop
    qbittorrent-enhanced


    ## Development ##
    jetbrains.idea-ultimate
    jetbrains.pycharm-community

    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; 
      [ # Write your VSCode extensions here.
        jnoortheen.nix-ide
        vscjava.vscode-java-pack
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-containers
      ];
    })
 
   
    ## Office ##
    libreoffice-qt6
    wpsoffice    


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
}

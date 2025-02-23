{ pkgs, config, libs, ... }:

{
   
  ### Nvidia videocard settings ###
  ### https://nixos.wiki/wiki/Nvidia ###
  ### https://wiki.hyprland.org/Nvidia/ ###


  ### Set Nvidia video driver ###
  services.xserver.videoDrivers = ["nvidia"];


  ### Nvidia kernel parameters ###
  boot = {
    kernelParams = [ 
      "nvidia-drm.modeset=1" 
      "nvidia_drm.fbdev=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
    
    initrd.kernelModules = [ 
      "nvidia"
      "nvidia_modeset" 
      "nvidia_uvm" 
      "nvidia_drm"
    ];
  };


  ### Hardware acceliration ### 
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };  

    nvidia = { 
      ## Nvidia drivers. ## Options: production, stable, latest, beta, vulkan_beta, legacy_470/390/340
      package = config.boot.kernelPackages.nvidiaPackages.latest;

      ## Modesetting is required. ##
      modesetting.enable = true;    

      ## Nvidia power management. ## Can cause sleep/suspend to fail.
      powerManagement.enable = true;

      ## Make Nvidia card headless mode ## May fix some bugs.
      nvidiaPersistenced = true;

      ## Fine-grained power managment. ## Turns off GPU when not in use.
      powerManagement.finegrained = false;

      ## Open kernel modules for Nvidia. ##
      open = true;

      ## Enable Nvidia settings menu. ## Access via 'nvidia-settings'.
      nvidiaSettings = true;    

      ## Enable GPU System Processor ##
      gsp.enable = true; 

      ## Force Full Composition Pipeline. ## Can fix screen tearing, but may reduce the performance.
      #forceFullCompositionPipeline = false;
    };
  };

  ### Nvidia variables for better performance ###
  environment.variables = {
    
    ## System ##
    LIBVA_DRIVER_NAME="nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";

    ## Wayland ##
    # WLR_RENDERER = "vulkan";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
  };

  ### Useful packages for Nvidia ###
  environment.systemPackages = with pkgs; [
    nvtopPackages.full # Nvidia monitoring app
    clinfo
    gwe
    virtualglLib
    vulkan-loader
    vulkan-tools

    nvidia-vaapi-driver
    vaapiVdpau
    libvdpau-va-gl
  ];
}

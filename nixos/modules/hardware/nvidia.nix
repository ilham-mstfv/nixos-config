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
  

    ## Fix random flickering ## Warning! It's a nuke method ##
    ## Use this method only if something doesn't work well. ##
    extraModprobeConfig=''
      options nvidia_drm modeset=1 fbdev=1
      options nvidia NVreg_RegistryDwords="PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3"
    '';
  };



  ### Hardware acceliration ### 
  hardware = {

    ## Use this on Unstable branch ##
    graphics = {
      enable = true;
      enable32Bit = true;
    };  

    ## Use this on Stable branch ##
    /*
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };  
    */
  };

  ### Nvidia Settings ###
  hardware.nvidia = {
    
    ## Nvidia drivers. ## Options: stable, beta, production, vulkan_beta, legacy_470 (or 390/340).
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    ## Modesetting is required. ##
    modesetting.enable = true;    

    ## Nvidia power managment. ## Can cause sleep/suspend to fail.
    powerManagement.enable = true;

    ## Make Nvidia card headless mode ## May fix some bugs.
    nvidiaPersistenced = true;

    ## Fine-grained power managment. ## Turns off GPU when not in use.
    powerManagement.finegrained = false;

    ## Open kernel modules for Nvidia. ##
    open = false;

    ## Enable Nvidia settings menu. ## Access via 'nvidia-settings'.
    nvidiaSettings = true;    

    ## Enable GPU System Processor ##
    gsp.enable = true;
    
    ## Force Full Composition Pipeline. ## # Can fix screen tearing, but may reduce the performance.
    # forceFullCompositionPipeline = false;
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

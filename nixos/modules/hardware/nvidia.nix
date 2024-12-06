{ pkgs, config, libs, ... }:

{
   
  ### Nvidia card settings ###
  ### https://nixos.wiki/wiki/Nvidia ###


  ### Set Nvidia video driver ###
  services.xserver.videoDrivers = ["nvidia"];


  ### Nvidia kernel parameters ###
  boot.kernelParams = [ 
    "nvidia-drm.modeset=1" 
    "nvidia_drm.fbdev=1" 
  ];

  ## Below needs to be tested
  # boot.kernelModules = [ 
  #   "nvidia_uvm" 
  # ];
  

  ### Hardware acceliration ### Comment this on Unstable branch.
  # hardware.opengl = {
  #   enable = true;
  #   driSupport = true;
  #   driSupport32Bit = true;
  # };

  ### Hardware acceliration ### Comment this on Stable branch.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
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
    # MOZ_ENABLE_WAYLAND = "1";
    # QT_QPA_PLATFORM = "wayland";
    # NIXOS_OZONE_WL = "1";
    # XDG_SESSION_TYPE = "wayland";
  };

  ### Useful packages for Nvidia ###
  environment.systemPackages = with pkgs; [
    nvtopPackages.full # Nvidia monitoring app
    clinfo
    gwe
    virtualglLib
    vulkan-loader
    vulkan-tools
  ];
}

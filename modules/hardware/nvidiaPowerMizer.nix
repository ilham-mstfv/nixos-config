{ pkgs, config, libs, ... }:

{
  boot = { 
    ## Fix random flickering. 
    ## Warning! It's a nuke method! 
    ## Use this method only if something doesn't work well.
    extraModprobeConfig=''
      options nvidia_drm modeset=1 fbdev=1
      options nvidia NVreg_RegistryDwords="PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3"
    '';
  };
}
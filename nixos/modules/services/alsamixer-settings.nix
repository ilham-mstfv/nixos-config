{ config, pkgs, ...}:

{
  ### Alsamixer Stable Settings ###
  ### These settings fix my speakers ###  

  /*
  ## Comment below if on Unstable. ##  
  ## Deprecated ##
  sound.enable = true;
  sound.extraConfig = ''
    Saving alsamixer settings
    load-module module-alsa-sink
    load-module module-alsa-source
  
    # Disabling Auto-Mute Mode
    options snd-hda-intel model=pch
    options snd-hda-intel auto_mute=0
  '';
  */
 

  ## Comment below if on Stable. ##
  hardware.alsa.enablePersistence = true;

  environment.systemPackages = with pkgs; [
    alsa-utils
  ];
}

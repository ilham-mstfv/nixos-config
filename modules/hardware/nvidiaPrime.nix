{ pkgs, config, libs, ... }:

{
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };
}
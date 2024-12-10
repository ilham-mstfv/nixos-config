{ pkgs, config, libs, ... }:

{
  ### Enable zram options ###
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 30;
  };
}

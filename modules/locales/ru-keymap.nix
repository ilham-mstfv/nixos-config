{ pkgs, libs, ... }:

{ 
  services.xserver.xkb = {
    layout = "ru";
    variant = "";
  };
}

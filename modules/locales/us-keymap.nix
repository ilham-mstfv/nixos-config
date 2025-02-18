{ pkgs, libs, ... }:

{ ## Default Settings ##
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}

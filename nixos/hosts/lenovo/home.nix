{ config, pkgs, vars, ... }:

{
  imports = [
    #../../modules/home/...
  ];

  home.username = "${vars.user}";
  home.homeDirectory = "/home/${vars.user}";

  home.packages = with pkgs; [
    alacritty
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}

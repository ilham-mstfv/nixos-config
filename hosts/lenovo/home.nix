{ config, pkgs, lib, inputs, system, vars, ... }:

{
  imports = [
    #../../modules/home/...
    ../../modules/home/programs/kitty.nix
  ];


  home.username = "${vars.user}";
  home.homeDirectory = "/home/${vars.user}";

  home.packages = with pkgs; [
    
  ];

  home.file."home-test/home-test.txt".text = ''
    Lenovo TEST FILE
  '';

  home.sessionVariables = {
    
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

{ config, pkgs, vars, ... }:

{
  imports = [
    #../../modules/home/...
  ];

  home.username = "${vars.user}";
  home.homeDirectory = "/home/${vars.user}";

  home.packages = with pkgs; [
    
  ];

  home.file."home-test/home-test.txt".text = ''
    TEST FILE
  '';

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}

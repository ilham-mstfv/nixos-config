{ pkgs, config, libs, ... }:

{
  # Better linux console 
  services.kmscon = { 

    enable = true;

    hwRender = true;

    # fonts = [ 
    #   { name = "Source Code Pro"; package = pkgs.source-code-pro; } 
    # ]; 
  };
}

{ pkgs, config, libs, ... }:

{
  ### Font settings. ###  
  fonts = {
    # Enable default Fonts.
    enableDefaultPackages = true;

    packages = with pkgs; [
      font-awesome
    ];
  };
}

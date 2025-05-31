{ pkgs, config, libs, inputs, ... }:

{
  imports = [ 
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    enableReleaseChecks = false;

    base16Scheme = 
      "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}

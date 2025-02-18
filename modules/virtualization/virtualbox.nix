{ pkgs, libs, vars, ... }:

{
  ### VirtualBox ###
  users.extraGroups.vboxusers.members = [ "${vars.user}" ];
  nixpkgs.config.allowUnfree = true;
 
  virtualisation = { 
    virtualbox = {
      host = {
        enable = true; 
        enableExtensionPack = true;
        enableKvm = false; # Experimental
      };
      guest = {
        enable = true;
        dragAndDrop = true;
        clipboard = true;
        seamless = true;
      };
    };
  };
}

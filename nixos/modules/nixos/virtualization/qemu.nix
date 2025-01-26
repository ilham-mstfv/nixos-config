{ pkgs, config, libs, vars, ... }:

{ ## Qemu ## 

  virtualisation.libvirtd.enable = true;
  
  users.users.${vars.user} = {
    extraGroups = [ "libvirtd" ];
  };

  programs.virt-manager.enable = true;

  environment = {
    systemPackages = [ pkgs.qemu_full ];
  };
}

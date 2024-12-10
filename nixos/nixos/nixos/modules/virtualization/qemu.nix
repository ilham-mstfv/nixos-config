{ pkgs, config, libs, ... }:

{ ## Qemu ## 

  virtualisation.libvirtd.enable = true;
  
  users.users.ilham = {
    extraGroups = [ "libvirtd" ];
  };

  programs.virt-manager.enable = true;

  environment = {
    systemPackages = [ pkgs.qemu_full ];
  };
}

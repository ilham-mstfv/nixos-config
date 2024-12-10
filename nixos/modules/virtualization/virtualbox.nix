{ pkgs, libs, ... }:

{
  ### VirtualBox ###
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "ilham" ];
  

  ## Enable VBox Quest Additions ##
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.dragAndDrop = true;
  # virtualisation.virtualbox.guest.clipboard = true;
  # virtualisation.virtualbox.guest.seamless = true;
  # virtualisation.virtualbox.host.enableKvm = true;
}

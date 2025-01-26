{ pkgs, config, libs, ... }:

{
  ### Enable NTFS file system ###
  boot.supportedFilesystems = [ "ntfs" ];

  environment.systemPackages = with pkgs; [
    ntfs3g
  ];
}

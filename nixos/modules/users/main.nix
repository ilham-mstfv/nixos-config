{ pkgs, config, libs, ... }:

{
  ### User account and user packages ### Set a password with ‘passwd’.
  users.users.ilham = {
    isNormalUser = true;
    description = "ilham";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.filelight      
    ];
  };
}

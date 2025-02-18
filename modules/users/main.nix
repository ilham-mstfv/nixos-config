{ pkgs, config, libs, vars, ... }:

{
  ### User account and user packages ### Set a password with ‘passwd’.
  users.users.${vars.user} = {
    isNormalUser = true;
    description = "${vars.user}";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [  ];
  };
}

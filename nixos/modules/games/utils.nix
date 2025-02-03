{ pkgs, config, libs, ...}:

{
  programs = {
    gamemode = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
    vkbasalt
  ];
}

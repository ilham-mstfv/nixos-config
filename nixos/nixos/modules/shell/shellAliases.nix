{ pkgs, config, libs, ... }:

{
  environment.shellAliases = {
      ll = "ls -l";
      ff = "fastfetch";

      modules = "cd /etc/nixos/modules";
      hosts = "cd /etc/nixos/hosts";

      ## Nix Package with Flakes ## Disabled due to Nix Helper
      # update = ''
      #   sudo nixos-rebuild switch --flake /etc/nixos#pc
      # '';
      #
      # upgrade = ''
      #   sudo nix flake update --flake /etc/nixos &&
      #   sudo nixos-rebuild switch --upgrade --flake /etc/nixos#pc
      # '';


      ## Nix Helper ##
      update = ''
        nh os switch
      '';

      upgrade = ''
        sudo nix flake update --flake /etc/nixos &&
        nh os switch --update
      '';


      ## GIT ##
      save-config = ''
        cp -r /etc/nixos/. /mnt/homedisk/Code/Git/nixos-configuration/nixos/ && 
        cd /mnt/homedisk/Code/Git/nixos-configuration/ && 
        git add . && 
        git commit -m "Update configuration" && 
        git push origin master &&
        cd
      '';

      save-new-config = ''
        rm -r /mnt/homedisk/Code/Git/nixos-configuration/nixos/ &&
        mkdir /mnt/homedisk/Code/Git/nixos-configuration/nixos/ &&
        save-config
      '';

      get-config = ''
        sudo cp -r /mnt/homedisk/Code/Git/nixos-configuration/nixos /etc/nixos
      '';

      get-new-config = ''
        sudo rm -r /etc/nixos &&
        get-config
      '';

      fetch-config = ''
        cd /mnt/homedisk/Code/Git/nixos-configuration/ &&
        git pull origin master
        cd
      '';

      fetch-new-config = ''
        cd /mnt/homedisk/Code/Git/nixos-configuration/ &&
        git fetch origin master
        rm -r ./nixos &&
        git reset --hard origin/master &&
        cd
      '';
  };
}

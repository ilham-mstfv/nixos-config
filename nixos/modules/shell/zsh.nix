{ pkgs, config, libs, ... }:

{
  ### Enable zsh ###
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      ff = "fastfetch";

      # update = ''
      #   sudo nixos-rebuild switch --flake /etc/nixos#pc
      # '';

      # upgrade = ''
      #   sudo nix flake update --flake /etc/nixos &&
      #   sudo nixos-rebuild switch --upgrade --flake /etc/nixos#pc
      # '';

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
        git push &&
        cd
      '';
      
      save-new-config = ''
        rm -r /mnt/homedisk/Code/Git/nixos-configuration/nixos/ &&
        mkdir /mnt/homedisk/Code/Git/nixos-configuration/nixos/ &&
        save-config
      '';

      get-config = ''
        sudo cp -r -u -i /mnt/homedisk/Code/Git/nixos-configuration/nixos/. /etc/nixos
      '';
    };

    ohMyZsh = {
      enable = true;
      # theme = "arrow";
      # plugins = [ "git" ];
    };
     
    promptInit = 
      "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    histSize = 2000;
    histFile = "$HOME/.zsh_history";
  };

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
}

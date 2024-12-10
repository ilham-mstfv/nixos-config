{ pkgs, config, libs, ... }:

{
  ### ZSH settings ###
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      # theme = "arrow";
      # plugins = [ "git" ];
    };
     
    promptInit = 
      "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
  };

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
}

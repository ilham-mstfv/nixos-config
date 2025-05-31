{ libs, config, vars, inputs, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      scrollback_lines = 10000;
      placement_strategy = "center";

      enable_audio_bell = "no";

      copy_on_select = "clipboard";

      selection_foreground = "none";
      selection_background = "none";

      # colors
      background_opacity = "0.25";
    };

    themeFile = "Catppuccin-Mocha";
  };
}

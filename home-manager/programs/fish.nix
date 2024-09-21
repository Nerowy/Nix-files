{config, ...}: {
  programs.fish = {
    enable = true;
    catppuccin.enable = false;

    shellInit = ''
      set -U fish_color_cwd blue
      set -U fish_color_user blue
      ${
        if config.programs.fastfetch.enable
        then "fastfetch"
        else ""
      }
    '';
  };
}

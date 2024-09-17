{
  pkgs,
  inputs,
  ...
}: let
  wallpaperImg = ./wallpaper.png;
in {
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.default;

    settings = {
      preload = ["${wallpaperImg}"];
      wallpaper = [",${wallpaperImg}"];
    };
  };
}

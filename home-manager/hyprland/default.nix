{
  inputs,
  pkgs,
  ...
}: {
  imports = [
  ./binds.nix
  ./settings.nix
  ./rules.nix

  inputs.hyprland.homeManagerModules.default
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  home.packages = [
  inputs.hyprland-contrib.packages.${pkgs.system}.grimblast   
  ];
}
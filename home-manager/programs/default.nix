{pkgs, ...}: {
  imports = [
    ./fastfetch
    ./vscodium.nix
    ./catppuccin.nix
    ./kitty.nix
    ./rofi.nix
    ./steam.nix
    ./xdg.nix
    ./gtk.nix
    ./git.nix
    ./btop.nix
    ./fish.nix
    ./waybar.nix
  ];
  home.packages = with pkgs; [
    vesktop
    lutris
    heroic
    osu-lazer-bin
    (prismlauncher.override {
      jdks = [
        zulu8
        zulu17
        zulu21
      ];
    })
  ];
}

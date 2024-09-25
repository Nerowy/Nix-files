{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/persist${config.home.homeDirectory}" = {
    directories = [
      "code"
      "documents"
      "downloads"
      "pictures"
      "videos"

      "nix-files"
      ".ssh"
      ".cache"
      ".local/share/Trash"
      ".terminfo"

      ".local/state/wireplumber"
      ".local/share/keyrings"
      ".local/share/direnv"
      ".config/vesktop"
      ".config/BraveSoftware/Brave-Browser"

      # prism launcher
      ".local/share/PrismLauncher"

      # lutris
      ".local/share/lutris"
      ".local/share/umu" # proton runtime

      # heroic
      ".config/heroic"

      # osu-lazer
      ".local/share/osu"
    ];

    files = [
      ".local/share/nix/repl-history"
    ];

    allowOther = true;
  };
}

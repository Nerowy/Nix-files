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

      ".local/share/keyrings"
      ".local/share/direnv"
      ".config/vesktop"
      ".config/BraveSoftware/Brave-Browser"
    ];

    files = [
      ".local/share/nix/repl-history"
    ];

    allowOther = true;
  };
}

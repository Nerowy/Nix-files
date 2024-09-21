{
  pkgs,
  config,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      editorconfig.editorconfig
    ];

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "editor.tabSize" = 2;
      "window.titleBarsStyle" = "custom";
      "editor.formatOnSave" = true;
      "nix.serverSettings.nil.formatting.command" = ["${pkgs.alejandra}/bin/alejandra" "-" "--quiet"];

      # https://github.com/nix-community/vscode-nix-ide
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil"; # pkgs.nil
    };
  };

  home.packages = with pkgs; [
    alejandra # formatter
    nil # nix language server
  ];

  home.persistence."/persist${config.home.homeDirectory}".directories = [
    ".config/VSCodium/CachedData"
    ".config/VSCodium/Cache"
    ".config/VSCodium/Backups"
    ".config/VSCodium/Code Cache"
    ".config/VSCodium/DawnCache"
    ".config/VSCodium/GPUCache"
    ".config/VSCodium/User/History"
    ".config/VSCodium/User/globalStorage"
    ".config/VSCodium/User/workspaceStorage"
    ".config/VSCodium/logs"
  ];
}

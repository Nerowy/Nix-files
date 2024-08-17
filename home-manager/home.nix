# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  pkgs,
  inputs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.hyprland.homeManagerModules.default
    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config.allowUnfree = true;
  };

  # TODO: Set your username
  home = {
    username = "newo";
    homeDirectory = "/home/newo";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    kdePackages.kate
    mpv
    vesktop
    brave
    nil
    piper
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
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

      # https://github.com/nix-community/vscode-nix-ide
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil"; # pkgs.nil
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
  catppuccin.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    settings = let
      runOnce = program: "pgrep ${program} || ${program}";
    in {
      # l -> locked, will also work when an input inhibitor (e.g. a lockscreen) is active.
      # r -> release, will trigger on release of a key.
      # e -> repeat, will repeat when held.
      # n -> non-consuming, key/mouse events will be passed to the active window in addition to triggering the dispatcher.
      # m -> mouse.
      # t -> transparent, cannot be shadowed by other binds.
      # i -> ignore mods, will ignore modifiers.
      # s -> separate, will arbitrarily combine keys between each mod/key, see [Keysym combos](#keysym-combos) above.
      # d -> has description, will allow you to write a description for your bind.

      bindm = [
        # use wev to find mouse button codes
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bind = [
        # compositor commands
        "$mod, Q, killactive"
        "$mod, F, fullscreenstate, 2 -1" # fullscreen the window, don't inform the client it was fullscreened
        "$mod SHIFT, F, fullscreenstate, -1 2" # keep current fullscreen state, tell client it is fullscreened
        "$mod, R, togglesplit"
        "$mod, G, togglefloating"
        "$mod, A, togglegroup"
        "$mod SHIFT, A, lockactivegroup, toggle"
        "ALT, TAB, changegroupactive, f"
        "$mod, T, pin"
        "CTRL ALT, DELETE, exec, hyprctl kill"
        "CTRL ALT SHIFT, DELETE, exec, pkill Hyprland"

        # utility
        ## terminal
        "$mod, Return, exec, kitty"
        ## launcher
        "$mod, S, exec, rofi -show drun -show-icons"
        ## browser
        "$mod, W, exec, brave"
        ## file explorer
        "$mod, E, exec, thunar"

        # move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # swap windows
        "$mod SHIFT, left, swapwindow, l"
        "$mod SHIFT, right, swapwindow, r"
        "$mod SHIFT, up, swapwindow, u"
        "$mod SHIFT, down, swapwindow, d"

        # screenshot
        ## area
        ", Print, exec, ${runOnce "grimblast"} --notify --freeze copy area"
        "$mod SHIFT, S, exec, ${runOnce "grimblast"} --notify --freeze copy area"
        ## current screen
        "CTRL, Print, exec, ${runOnce "grimblast"} --notify --cursor copy output"
        "$mod SHIFT CTRL, S, exec, ${runOnce "grimblast"} --notify --cursor copy output"
      ];
    };
  };
  programs.kitty.enable = true;
  services.mako.enable = true;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
}

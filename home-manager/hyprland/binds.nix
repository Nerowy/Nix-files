{
  wayland.windowManager.hyprland.settings = let
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

    "$mod" = "SUPER";

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
    monitor = [
      "desc:Microstep MSI G273Q CA8A461200959, 2560x1440@164.84, 0x0, 1"
      "desc:BNQ BenQ EL2870U R5M00857SL0, 2560x1440@59.95, auto-right, 1"
    ];
  };
}

let
  activeColor = "89b4fa";
  inactiveColor = "181825";
  alternateColor = "cba6f7";
in {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 3;
      gaps_out = 6;
      "col.active_border" = "rgb(${activeColor})";
      "col.inactive_border" = "rgba(${inactiveColor}88)";
    };

    decoration = {
      rounding = 5;
      drop_shadow = true;
      shadow_range = 8;
      shadow_render_power = 3;
      shadow_ignore_window = true;
      "col.shadow" = "rgba(00000055)";
      dim_inactive = false;

      blur = {
        enabled = true;
        size = 7;
        passes = 4;
        new_optimizations = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.01;
        vibrancy = 0.2;
        vibrancy_darkness = 0.5;
        popups = true;
        popups_ignorealpha = 0.2;
      };
    };

    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "XCURSOR_SIZE,16"
    ];

    exec-once = [
      "goxlr-daemon"
      "steam -silent"
    ];

    animations = {
      enabled = true;
      animation = [
        "border, 1, 2, default"
        "fade, 1, 4, default"
        "windows, 1, 3, default, popin 80%"
        "workspaces, 1, 2, default, slide"
      ];
    };

    input = {
      kb_layout = "us";

      accel_profile = "flat";

      touchpad = {
        natural_scroll = true;
        scroll_factor = 0.5;
        disable_while_typing = false;
      };
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      # disable auto polling for config file changes
      disable_autoreload = true;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };

    render.direct_scanout = false;

    # touchpad gestures
    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    group = {
      "col.border_active" = "rgb(${alternateColor})";
      "col.border_inactive" = "rgba(${inactiveColor}88)";
      "col.border_locked_active" = "rgb(${activeColor})";
      "col.border_locked_inactive" = "rgba(${inactiveColor}88)";
      groupbar = {
        height = 6;
        render_titles = false;
        "col.active" = "rgb(${alternateColor})";
        "col.inactive" = "rgb(${inactiveColor})";
        "col.locked_active" = "rgb(${activeColor})";
        "col.locked_inactive" = "rgb(${inactiveColor})";
      };
    };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "desc:Microstep MSI G273Q CA8A461200959, 2560x1440@164.84, 0x0, 1"
      "desc:BNQ BenQ EL2870U R5M00857SL0, 2560x1440@59.95, auto-right, 1"
    ];
  };
};
}
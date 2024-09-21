{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "kitty-direct";
        source = ./fastfetch.png;
        width = 18;
        height = 8;
        padding = {
          left = 0;
          right = 2;
        };
      };

      display = {
        separator = ": ";
        color = {
          title = "blue";
          separator = "dim_white";
          keys = "blue";
        };
      };

      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        {
          key = "Compositor";
          type = "wm";
        }
        "terminal"
        "packages"
        {
          type = "memory";
          percent = {
            green = 0;
            yellow = 0;
          };
        }
      ];
    };
  };
}

{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    accent = "blue";
    flavor = "mocha";
    pointerCursor.enable = true;
    pointerCursor.accent = "blue";
    pointerCursor.flavor = "mocha";
  };
}
{pkgs, ...}: {
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      # proton ge with rtsp patch, for vrchat video players
      (proton-ge-bin.overrideAttrs (finalAttrs: let
        version = "GE-Proton9-11-rtsp15";
      in {
        pname = "proton-ge-rtsp-bin";
        inherit version;
        src = pkgs.fetchzip {
          url = "https://github.com/SpookySkeletons/proton-ge-rtsp/releases/download/${version}/${version}.tar.gz";
          hash = "sha256-3QWJUVkMgZldEXFVsry1FoKVE9y6Tg4IREAruPuL+hk=";
        };
      }))
    ];
  };
  hardware.steam-hardware.enable = true;
}

{pkgs, ...}: {
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      (proton-ge-bin.overrideAttrs (finalAttrs: {
        pname = "proton-ge-rtsp-bin";
        version = "GE-Proton9-11-rtsp15";
        src = pkgs.fetchzip {
          url = "https://github.com/SpookySkeletons/proton-ge-rtsp/releases/download/GE-Proton9-11-rtsp15/GE-Proton9-11-rtsp15.tar.gz";
          hash = "sha256-3QWJUVkMgZldEXFVsry1FoKVE9y6Tg4IREAruPuL+hk=";
        };
      }))
    ];
  };
  hardware.steam-hardware.enable = true;
}

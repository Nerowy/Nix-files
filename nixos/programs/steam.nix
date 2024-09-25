{pkgs, ...}: {
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      (proton-ge-bin.overrideAttrs (finalAttrs: {
        pname = "proton-ge-rtsp-bin";
        version = "GE-Proton9-11-rtsp15";
        src = pkgs.fetchzip {
          url = "https://github.com/SpookySkeletons/proton-ge-rtsp/releases/tag/GE-Proton9-11-rtsp15";
          hash = "sha256-jf1p33Kuqtriycf6gOw/IBdx/ts/P7PJd+pjxonAS/U=";
        };
      }))
    ];
  };
  hardware.steam-hardware.enable = true;
}

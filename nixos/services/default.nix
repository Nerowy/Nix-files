{
  imports = [
    ./ratbagd.nix
    ./pipewire.nix
    ./openssh.nix
    ./tailscale.nix
    (import ./autologin.nix "newo")
  ];
}

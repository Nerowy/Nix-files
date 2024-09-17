# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ./hardware
    ./programs
    ./services
    ./core
    ./nix

    ./hardware-configuration.nix
    ./disk-configuration.nix
  ];

  networking = {
    hostName = "newo";
    hostId = "4360ed1b";
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users.newo = import ../home-manager/home.nix;
  };

  # https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}

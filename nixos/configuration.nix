# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    
    # You can also split up your configuration and import pieces of it here:
    # ./users.nix
    ./hardware
    ./programs
    ./services
    ./core
    ./nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ./disk-configuration.nix
  ];

  # Standalone home-manager configuration entrypoint
  # Available through 'home-manager --flake .#your-username@your-hostname'

  # FIXME replace with your username@hostname
  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    # > Our main home-manager configuration file <
    users.newo = import ../home-manager/home.nix;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
  

  

  
  
  

}

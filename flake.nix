{
  description = "nixos adventure";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # hypr utilities
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      newo = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        # > Our main nixos configuration file <
        modules = [./nixos/configuration.nix];
      };
    };
  };
}

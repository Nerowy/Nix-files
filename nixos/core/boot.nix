{inputs, ...}: {
  imports = [
    inputs.disko.nixosModules.default
  ];
  
  # Bootloader.
  boot = {
    initrd = {
      systemd.enable = true;
      availableKernelModules = ["hid_generic"];
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = ["zfs" "ntfs"];
  };
}

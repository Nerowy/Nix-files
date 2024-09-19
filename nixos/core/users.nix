{config, ...}: {
  age.secrets.password.file = ../../secrets/password.age;

  users.users = {
    newo = {
      isNormalUser = true;
      hashedPasswordFile = config.age.secrets.password.path;

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIoe3VveHt2vXoHdkRbLE0Xx5il0T3v8PiWxFvdniSLg different@sodium"
      ];

      extraGroups = [
        "wheel"
        "audio"
        "video"
        "input"
        "networkmanager"
        "libvirtd"
      ];
    };
  };
}

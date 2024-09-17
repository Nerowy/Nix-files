{
  # This setups a SSH server. Very important if you're setting up a headless system.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      PasswordAuthentication = false;
    };
  };
}

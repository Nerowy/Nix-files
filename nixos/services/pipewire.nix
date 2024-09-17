{lib, ...}: {
  # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  hardware.pulseaudio.enable = lib.mkForce false;

  environment.persistence."/persist/system".directories = [
    "/etc/pipewire"
  ];
}

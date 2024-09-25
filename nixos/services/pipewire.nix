{lib, ...}: {
  # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;

    extraConfig.pipewire = {
      "10-equalizer" = {
        context.modules = [
          {
            name = "libpipewire-module-filter-chain";
            args = {
              node.description = "Equalizer Sink";
              media.name = "Equalizer Sink";
              filter.graph = {
                nodes = [
                  {
                    type = "builtin";
                    name = "eq_band_1";
                    label = "bq_lowshelf";
                    control = {
                      "Freq" = 100.0;
                      "Q" = 1.0;
                      "Gain" = 0.0;
                    };
                  }
                  {
                    type = "builtin";
                    name = "eq_band_2";
                    label = "bq_peaking";
                    control = {
                      "Freq" = 100.0;
                      "Q" = 1.0;
                      "Gain" = 0.0;
                    };
                  }
                  {
                    type = "builtin";
                    name = "eq_band_3";
                    label = "bq_peaking";
                    control = {
                      "Freq" = 500.0;
                      "Q" = 1.0;
                      "Gain" = 0.0;
                    };
                  }
                  {
                    type = "builtin";
                    name = "eq_band_4";
                    label = "bq_peaking";
                    control = {
                      "Freq" = 2000.0;
                      "Q" = 1.0;
                      "Gain" = 0.0;
                    };
                  }
                  {
                    type = "builtin";
                    name = "eq_band_5";
                    label = "bq_peaking";
                    control = {
                      "Freq" = 5000.0;
                      "Q" = 1.0;
                      "Gain" = 0.0;
                    };
                  }
                  {
                    type = "builtin";
                    name = "eq_band_6";
                    label = "bq_highshelf";
                    control = {
                      "Freq" = 5000.0;
                      "Q" = 1.0;
                      "Gain" = 0.0;
                    };
                  }
                ];
                links = [
                  {
                    output = "eq_band_1:Out";
                    input = "eq_band_2:In";
                  }
                  {
                    output = "eq_band_2:Out";
                    input = "eq_band_3:In";
                  }
                  {
                    output = "eq_band_3:Out";
                    input = "eq_band_4:In";
                  }
                  {
                    output = "eq_band_4:Out";
                    input = "eq_band_5:In";
                  }
                  {
                    output = "eq_band_5:Out";
                    input = "eq_band_6:In";
                  }
                ];
              };
              audio.channels = 2;
              audio.position = ["FL" "FR"];
              capture.props = {
                node.name = "effect_input.eq6";
                media.class = "Audio/Sink";
              };
              playback.props = {
                node.name = "effect_output.eq6";
                node.passive = true;
              };
            };
          }
        ];
      };
    };
  };

  hardware.pulseaudio.enable = lib.mkForce false;

  environment.persistence."/persist/system".directories = [
    "/etc/pipewire"
  ];
}

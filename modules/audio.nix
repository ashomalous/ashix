{
  flake.aspects.pulseaudio.nixos = _: {
    services.pulseaudio.enable = true;
    security.rtkit.enable = true;
  };

  flake.aspects.pipewire.nixos =
    { pkgs, ... }:
    {
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      environment.systemPackages = with pkgs; [
        pwvucontrol
        alsa-scarlett-gui
      ];
    };
}

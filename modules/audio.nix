{
  den.aspects.pulseaudio.nixos = {
    services.pulseaudio.enable = true;
    security.rtkit.enable = true;
  };

  den.aspects.pipewire.nixos =
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

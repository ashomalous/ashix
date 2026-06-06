{
  flake.modules.nixos.pulseaudio = {
    services.pulseaudio.enable = true;
    security.rtkit.enable = true;
  };

  flake.modules.nixos.pipewire =
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

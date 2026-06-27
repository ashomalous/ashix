{
  den.aspects.pulseaudio.nixos = {
    services.pulseaudio.enable = true;
    security.rtkit.enable = true;

    persist.user.directories = [ ".config/pulse" ];
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

      persist.user.directories = [ ".local/state/wireplumber" ];
    };

  den.aspects.recording.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [audacity];
  };
}

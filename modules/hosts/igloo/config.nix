{
  flake.aspects = { aspects, ... }: {
    igloo = {
      includes = with aspects; [
        system-desktop
        systemd-boot
        quietBoot
        bluetooth

        niri
        dank-material-shell
        ly

        gaming

        flatpak

        ashomaly
      ];
    };
  };
}

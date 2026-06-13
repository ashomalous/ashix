{ den, ... }: {
  den.aspects = {
    igloo = {
      includes = with den.aspects; [
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

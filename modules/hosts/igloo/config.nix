{ den, ... }: {
  den.aspects = {
    igloo = {
      includes = with den.aspects; [
        disk-with-persistence
        # system-desktop
        system-cli
        systemd-boot
        # quietBoot
        bluetooth

        niri
        # dank-material-shell
        ly

        # gaming

        # flatpak

        # ashomaly
      ];
    };
  };
}

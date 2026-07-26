{ den, ... }: {
  den.aspects.igloo = {
    includes = with den.aspects; [
      (disk-with-persistence "/dev/nvme0n1")
      intelDrivers

      system-desktop
      # system-cli
      systemd-boot
      # quietBoot
      bluetooth

      niri
      mangowc
      # dank-material-shell
      ly

      gaming

      # flatpak

      bibataCursors
      catppuccinGtk

      ashomaly
    ];
  };
}

{ den, ... }: {
  den.aspects.igloo = {
    includes = with den.aspects; [
      (disk-with-persistence "/dev/nvme0n1")
      intelDrivers

      system-desktop
      systemd-boot
      bluetooth

      niri
      mangowc
      ly
      waybar

      gaming
      minecraft

      bibataCursors
      catppuccinGtk

      ashomaly
    ];
  };
}

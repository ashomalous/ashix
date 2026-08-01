{ den, ... }: {
  den.aspects.igloo = {
    includes = with den.aspects; [
      (disk-with-persistence "/dev/nvme0n1" "16G")
      intelDrivers
      (stateVersion "25.05")

      system-desktop
      systemd-boot
      bluetooth

      # niri
      mangowc
      # ly
      waybar

      gaming
      minecraft

      bibataCursors
      catppuccinGtk

      ashomaly
    ];
  };
}

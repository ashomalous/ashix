{ den, ... }: {
  den.aspects.iceberg = {
    includes = with den.aspects; [
      # (disk-with-persistence "/dev/nvme0n1")

      system-desktop
      # system-cli
      systemd-boot
      # quietBoot
      # bluetooth

      # niri
      # mangowc
      # dank-material-shell
      # ly

      # gaming

      # flatpak

      ashomaly
    ];
  };
}

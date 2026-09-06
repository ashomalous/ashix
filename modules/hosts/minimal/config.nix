{ den, ... }: {
  den.aspects.minimal = device: ramSize: {
    includes = with den.aspects; [
      (disk-with-persistence device ramSize)

      systemd-boot
      networking

      ashomaly
    ];
  };
}

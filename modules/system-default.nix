{ den, ... }: {
  den.aspects.system-default = {
    includes = with den.aspects; [
      system-minimal

      power-management
      networking
      locale
      comma
    ];
  };
}

{ den, ... }: {
  den.aspects.system-minimal = {
    includes = with den.aspects; [
      nix-settings

      power-management
      networking
      fonts
      locale
      git
    ];
  };
}

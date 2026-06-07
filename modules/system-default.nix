{
  flake.aspects = { aspects, ... }: {
    system-default = {
      includes = with aspects; [
        system-minimal

        power-management
        networking
        locale
        comma
      ];
    };
  };
}

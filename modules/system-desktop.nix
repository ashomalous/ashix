{ den, ... }: {
  den.aspects.system-desktop = {
    includes = with den.aspects; [
      system-cli

      printing

      zen-browser
      office

      pipewire
    ];
  };
}

{
  flake.aspects = { aspects, ... }: {
    system-desktop = {
      includes = with aspects; [
        system-cli

        printing

        zen-browser
        office
      ];
    };
  };
}

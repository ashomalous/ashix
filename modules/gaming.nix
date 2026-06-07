{
  flake.aspects = { aspects, ... }: {
    gaming = {
      includes = with aspects; [
        windows-compat

        steam
        gamescope
        gamemode
      ];

      nixos =
        { pkgs, ... }:
        {
          environment.systemPackages = with pkgs; [
            heroic
            mangohud
            goverlay
            joystickwake
            lutris
            umu-launcher
            faugus-launcher
          ];
        };
    };
  };
}

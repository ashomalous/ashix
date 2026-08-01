{ den, ... }: {
  den.aspects.steam = {
    includes = with den.aspects; [
      gamescope
      gamemode

      sls-steam
    ];

    nixos = { inputs', pkgs, ... }: {
      environment.systemPackages = [
        inputs'.sls-steam.packages.default
      ];
      programs.steam = {
        enable = true;
        extraCompatPackages = with pkgs; [ proton-ge-bin ];

        gamescopeSession.enable = true;
        protontricks.enable = true;
      };

      hardware.steam-hardware.enable = true;
      hardware.graphics.enable32Bit = true;

      persist.user.directories = [ ".local/share/Steam" ];
    };
  };
}

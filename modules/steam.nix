{ den, ... }: {
  den.aspects.steam = {
    includes = with den.aspects; [
      gamescope
      gamemode
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

        package = pkgs.steam.override {
          extraEnv = {
            LD_AUDIT = "${inputs'.sls-steam.packages.sls-steam}/library-inject.so:${inputs'.sls-steam.packages.sls-steam}/SLSsteam.so";
          };
        };
      };
      hardware.steam-hardware.enable = true;
      hardware.graphics.enable32Bit = true;

      persist.user.directories = [ ".local/share/Steam" ];
    };
  };
}

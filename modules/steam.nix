{ den, ... }: {
  den.aspects.steam = {
    includes = with den.aspects; [ gamescope gamemode ];

    nixos = { pkgs, ... }: {
      programs.steam = {
        enable = true;
        extraCompatPackages = with pkgs; [ proton-ge-bin ];

        gamescopeSession.enable = true;
        protontricks.enable = true;
        extest.enable = true;

        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
      };
      hardware.steam-hardware.enable = true;
      hardware.graphics.enable32Bit = true;

      persist.user.directories = [ ".local/share/Steam" ];
    };
  };
}

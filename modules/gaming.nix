{ den, ... }: {
  den.aspects.gaming = {
    includes = with den.aspects; [ steam ];

    nixos =
      { lib, pkgs, ... }:
      {
        programs.gamemode = {
          enable = true;
          settings = {
            general = {
              renice = 10;
            };

            # Warning: GPU optimisations have the potential to damage hardware
            gpu = {
              apply_gpu_optimisations = "accept-responsibility";
              gpu_device = 0;
            };

            custom = {
              start = "${lib.getExe' pkgs.libnotify "notify-send"} 'GameMode started'";
              end = "${lib.getExe' pkgs.libnotify "notify-send"} 'GameMode ended'";
            };
          };
        };

        hardware.graphics.enable32Bit = true;

        environment.systemPackages = with pkgs; [
          lutris
          umu-launcher
          faugus-launcher

          protonup-qt
          winetricks

          mangohud
          gamemode

          sc-controller

          nvtopPackages.full
        ];

        persist.user.directories = [ "Games" ];
      };
  };

  den.aspects.steam.nixos = _: {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };

    persist.user.directories = [ ".local/share/Steam" ];
  };
}

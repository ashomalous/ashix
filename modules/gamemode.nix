{
  den.aspects.gamemode.nixos = { lib, pkgs, ... }: {
    programs.gamemode = {
      enable = true;
      settings = {
        general = {
          softrealtime = "on";
          inhibit_screensaver = 1;
          renice = 10;
        };

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
  };
}

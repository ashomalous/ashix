{ den, ... }: {
  den.aspects.gaming = {
    includes = with den.aspects; [
      steam
      gamescope
      gamemode
    ];

    nixos =
      { pkgs, ... }:
      {
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
}

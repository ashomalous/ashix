{
  flake.aspects = { aspects, ... }: {
    steam = {
      includes = with aspects; [ gamescope ];

      nixos = { pkgs, ... }: {
        programs.steam = {
          enable = true;
          extraCompatPackages = with pkgs; [ proton-ge-bin ];
          gamescopeSession.enable = true;
        };
        hardware.steam-hardware.enable = true;
        hardware.graphics.enable32Bit = true;
      };
    };
  };
}

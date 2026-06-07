{
  flake.aspects = { aspects, ... }: {
    lutris = {
      includes = with aspects; [
        gamescope
        gamemode
        mangohud
      ];

      nixos = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [ lutris ];
      };
    };
  };
}

{ den, ... }: {
  den.aspects.grim = {
    includes = with den.aspects; [ screenshots ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ grim ];
    };
  };
}

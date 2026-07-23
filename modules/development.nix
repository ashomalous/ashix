{ den, ... }: {
  den.aspects.development = {
    includes = with den.aspects; [
      git
      gh
    ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ devenv ];
    };
  };
}

{ den, ... }: {
  den.aspects.pass = {
    includes = with den.aspects; [ gnupg ];
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ pass ];
      };
  };
}

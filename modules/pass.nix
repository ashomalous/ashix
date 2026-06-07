{
  flake.aspects = { aspects, ... }: {
    pass = {
      includes = with aspects; [ gnupg ];
      nixos =
        { pkgs, ... }:
        {
          environment.systemPackages = with pkgs; [ pass ];
        };
    };
  };
}

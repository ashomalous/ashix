{
  den.aspects.gh.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ gh ];

    persist.user.directories = [ ".config/gh" ];
  };
}

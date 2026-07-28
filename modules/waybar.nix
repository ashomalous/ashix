{ den, ... }: {
  den.aspects.waybar = {
    includes = with den.aspects; [ (userGroups "input") ];
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ waybar ];
    };
  };
}

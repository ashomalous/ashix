{ den, ... }: {
  den.aspects.dunst = {
    includes = [ den.aspects.notify ];
    nixos = _: {
      services.dunst.enable = true;
      services.dunst.enableWayland = true;
    };
  };
}

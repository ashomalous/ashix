{
  flake.aspects.steam.nixos = _: {
    programs.steam.enable = true;
    hardware.steam-hardware.enable = true;
    hardware.graphics.enable32Bit = true;
  };
}

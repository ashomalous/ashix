{
  flake.aspects.bluetooth.nixos = _: {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
  };
}

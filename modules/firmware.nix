{
  den.aspects.firmware.nixos = {
    services.fwupd.enable = true;
    hardware.enableAllFirmware = true;
    hardware.enableRedistributableFirmware = true;
    nixpkgs.config.allowUnfree = true; # dependency of enableAllFirmware
  };
}

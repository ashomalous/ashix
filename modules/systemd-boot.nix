{
  den.aspects.systemd-boot.nixos = {
    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    boot.loader.efi.canTouchEfiVariables = true;
  };
}

{
  den.aspects.bluetooth.nixos = {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    persist.directories = [ "/var/lib/bluetooth" ];
  };
}

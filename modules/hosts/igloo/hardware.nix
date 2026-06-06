{
  flake.modules.nixos.igloo = {
    hardware.facter.reportPath = ./facter.json;
  };
}

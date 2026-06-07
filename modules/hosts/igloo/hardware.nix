{
  flake.aspects.igloo.nixos = {
    hardware.facter.reportPath = ./facter.json;
  };
}

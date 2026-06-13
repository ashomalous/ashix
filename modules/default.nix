{ den, ... }: {
  den.default = {
    nixos.system.stateVersion = "25.05";

    includes = [
      den.batteries.hostname
      den.batteries.define-user
    ];
  };
}

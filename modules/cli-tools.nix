{ den, ... }: {
  den.aspects.cli-tools = {
    includes = with den.aspects; [
      git
      gh
      zellij
    ];

    nixos =
      { pkgs, lib, ... }:
      {
        environment.systemPackages = lib.optional (pkgs.stdenv.hostPlatform.system == "x86_64-linux") pkgs.intel-gpu-tools;
      };
  };
}

{ inputs, ... }: {
  den.aspects.blender.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.blender-bin.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}

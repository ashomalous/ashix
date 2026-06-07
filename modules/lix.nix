{
  flake.aspects.lix.nixos =
    { pkgs, ... }:
    {
      nix.package = pkgs.lixPackageSets.stable.lix;
    };
}

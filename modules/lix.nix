{
  flake.modules.nixos.lix =
    { pkgs, ... }:
    {
      nix.package = pkgs.lixPackageSets.stable.lix;
    };
}

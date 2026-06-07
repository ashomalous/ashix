{ inputs, ... }:
{
  flake.aspects.comma.nixos = _: {
    imports = [ inputs.nix-index-database.nixosModules.default ];

    programs.nix-index-database.comma.enable = true;
    programs.command-not-found.enable = false;
  };
}

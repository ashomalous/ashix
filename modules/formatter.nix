{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { pkgs, ... }:
    {
      treefmt.programs = {
        deadnix.enable = true;
        keep-sorted.enable = true;
        nixfmt.enable = true;
        shfmt.enable = true;
        statix.enable = true;
      };

      devshells.default.packages = with pkgs; [
        deadnix
        keep-sorted
        nixfmt-tree
        shfmt
        statix
      ];
    };
}

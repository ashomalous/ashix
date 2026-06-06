{
  flake.modules.nixos.dank-material-shell =
    { pkgs, ... }:
    {
      programs.dms-shell.enable = true;
    };
}

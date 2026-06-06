{ inputs, ... }:
{
  imports = [ inputs.devshell.flakeModule ];

  perSystem =
    {
      inputs',
      self',
      pkgs,
      lib,
      ...
    }:
    {
      devshells.default = {
        name = "ashix";

        packages = with pkgs; [
          inputs'.nixos-cli.packages.default

          just
          just-lsp
          stow

          nil
          nixd
        ];

        commands = lib.mapAttrsToList (name: app: {
          inherit name;
          help = app.meta.description;
          command = ''
            pushd $(git rev-parse --show-toplevel)
            nix run .#${name}
            popd
          '';
        }) self'.apps;
      };
    };
}

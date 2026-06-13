{ inputs, ... }:
{
  den.aspects.system-minimal.nixos =
    { lib, pkgs, ... }:
    {
      nixpkgs.overlays = [
        (final: _prev: {
          unstable = import inputs.nixpkgs-unstable {
            inherit (final) config;
            inherit (pkgs.stdenv.hostPlatform) system;
          };
        })
      ];
      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "25.05";

      nixpkgs.flake.setFlakeRegistry = true;
      nix.registry =
        inputs |> lib.filterAttrs (_: lib.isType "flake") |> lib.mapAttrs (_: flake: { inherit flake; });

      nix.settings = {
        substituters = [
          "https://cache.nixos.org?priority=10"
          "https://nix-community.cachix.org"
        ];

        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];

        experimental-features = [
          "nix-command"
          "flakes"
          "pipe-operators"
        ];

        download-buffer-size = 1024 * 1024 * 1024;

        trusted-users = [
          "root"
          "@wheel"
        ];

        connect-timeout = 5;

        min-free = 128 * 1024 * 1024;
        max-free = 1024 * 1024 * 1024;

        fallback = true;

        warn-dirty = false;
      };

      nix.channel.enable = false;

      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      nix.nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];

      programs.nix-ld.enable = true;
      programs.nix-index.enable = true;
    };
}

{ inputs, ... }: {
  den.aspects.wpaperd.nixos = { self', ... }: {
    environment.systemPackages = with self'.packages; [ wpaperd ];
  };

  perSystem = { pkgs, ... }: {
    packages.wpaperd =
      let
        config-file =
          builtins.toFile "config.toml"
            # toml
            ''
              [any]
              path = "${./wallpapers}"
            '';
      in
      inputs.wrappers.lib.wrapPackage (_: {
        inherit pkgs;
        package = pkgs.wpaperd;
        flags."--config" = config-file;
      });
  };
}

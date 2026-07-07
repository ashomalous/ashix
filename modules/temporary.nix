{
  den.aspects.temporary = { user, ... }: {
    nixos = { config, lib, ... }: {
      # temporary.user.directories.".config" = {};
      systemd.tmpfiles.settings.tmp-user-dirs =
        config.temporary.user.directories
        |> map (dir: {
          "/home/${user.name}/${dir}".d = {
            user = user.name;
            group = "users";
            mode = "0755";
          };
        })
        |> lib.mkMerge;
    };
  };

  den.default.nixos = { lib, ... }: {
    options.temporary = {
      # directories = lib.mkOption {
      #   default = [ ];
      # };
      # files = lib.mkOption {
      #   default = [ ];
      # };
      user.directories = lib.mkOption {
        default = [ ];
      };
    };
  };

}

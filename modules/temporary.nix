{
  den.aspects.temporary = { user, ... }: {
    nixos = { config, lib, ... }: {
      systemd.tmpfiles.settings.tmp-user-dirs = lib.mkMerge (
        map (dir: {
          "/home/${user.name}/${dir}".d = {
            user = user.name;
            group = "users";
            mode = "0755";
          };
        }) config.temporary.user.directories
      );
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

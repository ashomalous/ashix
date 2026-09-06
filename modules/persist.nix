{
  den.aspects.persist.nixos = _: {
    # minimal defaults
    persist = {
      enable = true;
      directories = [
        "/etc/nixos"
        {
          directory = "/var/lib/nixos";
          inInitrd = true;
        }
        {
          directory = "/tmp"; # keep /tmp off tmpfs
          mode = "1777";
        }
      ];
      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
      ];
      user.directories = [
        "ashix" # bootstrap this flake's safety

        ".cache" # keep .cache off tmpfs to avoid high RAM usage
        "tmp"

        "persist"
      ];
    };
  };

  den.default.nixos = { config, lib, ... }: {
    options.persist = {
      enable = lib.mkEnableOption "persistence";

      dirName = lib.mkOption {
        type = lib.types.singleLineStr;
        default = "persist";
      };
      dir = lib.mkOption {
        default = "/${config.persist.dirName}";
      };

      directories = lib.mkOption {
        default = [ ];
      };
      files = lib.mkOption {
        default = [ ];
      };
      user = lib.mkOption {
        type = lib.types.submodule {
          options = {
            directories = lib.mkOption {
              default = [ ];
            };
            files = lib.mkOption {
              default = [ ];
            };
          };
        };
      };
    };
  };
}

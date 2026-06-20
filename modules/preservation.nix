{ inputs, ... }: {
  den.aspects.preservation = { user, ... }: {
    nixos = { config, lib, ... }: {
      imports = [ inputs.preservation.nixosModules.default ];

      boot.initrd.systemd.enable = true; # required by preservation
      preservation = {
        enable = true;

        preserveAt."/persist" = {
          inherit (config.persist) directories files;
          users.${user.name} = { inherit (config.persist.user) directories files; };
        };
      };

      persist = {
        directories = [
          "/etc/nixos"
          {
            directory = "/var/lib/nixos";
            inInitrd = true;
          }
          # "/tmp" # keep /tmp off tmpfs
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
        ];
      };

      # these directories would by default be unwritable to the user as they'd be owned by root
      systemd.tmpfiles.settings.preservation =
        let
          permission = {
            user = user.name;
            group = lib.mkForce user.name;
            mode = lib.mkForce "0750";
          };
        in
        {
          "/home/${user.name}/.config".d = permission;
          "/home/${user.name}/.local".d = permission;
          "/home/${user.name}/.local/share".d = permission;
          "/home/${user.name}/.local/state".d = permission;
        };

      # HACK: fix for /etc/machine-id
      # systemd-machine-id-commit.service fails, but that's not relevant so it's disabled
      systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];

      # let the service commit the transient ID to the persistent volume
      systemd.services.systemd-machine-id-commit = {
        unitConfig.ConditionPathIsMountPoint = [
          ""
          "/persist/etc/machine-id"
        ];
        serviceConfig.ExecStart = [
          ""
          "systemd-machine-id-setup --commit --root /persist"
        ];
      };

      boot.tmp.cleanOnBoot = true;
    };
  };

  den.default.nixos = { config, lib, ... }: {
    options.persist = {
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

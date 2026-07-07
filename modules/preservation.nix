{ den, inputs, ... }: {
  den.aspects.preservation = { user, ... }: {
    includes = with den.aspects; [
      initrd # required by preservation

      persist # sane defaults for persistence
      temporary # allows for creation of additional dirs/files declaratively
    ];

    nixos = { config, ... }: {
      imports = [ inputs.preservation.nixosModules.default ];

      preservation = {
        enable = true;

        preserveAt."/persist" = {
          inherit (config.persist) directories files;
          users.${user.name} = { inherit (config.persist.user) directories files; };
        };
      };

      # these directories would by default be unwritable to the user as they'd be owned by root
      systemd.tmpfiles.settings.preservation =
        let
          permission = {
            user = user.name;
            group = "users";
            mode = "0755";
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
}

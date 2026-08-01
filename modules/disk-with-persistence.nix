{ den, ... }: {
  den.aspects.disk-with-persistence = device: ramSize: {
    includes = with den.aspects; [
      disko
      preservation
    ];

    nixos =
      { config, ... }:
      let
        nixDirName = "nix";
        nixDir = "/${nixDirName}";
        persistDirName = config.persist.dirName;
        persistDir = "/${persistDirName}";
      in
      {
        fileSystems.${nixDir}.neededForBoot = true;
        fileSystems.${persistDir}.neededForBoot = true;

        disko.devices.nodev."/" = {
          fsType = "tmpfs";
          mountOptions = [
            "size=25%"
            "mode=755"
          ];
        };

        disko.devices.disk.main = {
          inherit device;
          type = "disk";

          content.type = "gpt";

          content.partitions = {
            boot = {
              name = "boot";
              size = "1G";
              type = "EF00";

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };

            swap = {
              size = ramSize;

              content = {
                type = "swap";
                resumeDevice = true;
              };
            };

            root = {
              name = "root";
              size = "100%";

              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];

                subvolumes = {
                  ${persistDir} = {
                    mountOptions = [
                      "subvol=${persistDirName}"
                      "noatime"
                    ];
                    mountpoint = persistDir;
                  };
                  ${nixDir} = {
                    mountOptions = [
                      "subvol=${nixDirName}"
                      "noatime"
                    ];
                    mountpoint = nixDir;
                  };
                };
              };
            };
          };
        };
      };
  };
}

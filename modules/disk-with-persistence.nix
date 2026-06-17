{ den, ... }: {
  den.aspects.disk-with-persistence = {
    includes = with den.aspects; [
      disko
      preservation
    ];

    nixos = {
      fileSystems."/nix".neededForBoot = true;
      fileSystems."/persist".neededForBoot = true;

      disko.devices.nodev."/" = {
        fsType = "tmpfs";
        mountOptions = [
          "size=25%"
          "mode=755"
        ];
      };

      disko.devices.disk.main = {
        device = "/dev/nvme0n1";
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
            size = "16G";

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
                "/persist" = {
                  mountOptions = [
                    "subvol=persist"
                    "noatime"
                  ];
                  mountpoint = "/persist";
                };
                "/nix" = {
                  mountOptions = [
                    "subvol=nix"
                    "noatime"
                  ];
                  mountpoint = "/nix";
                };
              };
            };
          };
        };
      };
    };
  };
}

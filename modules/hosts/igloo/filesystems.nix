let
  config = {
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/6ee28db1-4299-4e20-9f42-6f3f2b7bccf7";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/7837-0CA0";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };
    };

    swapDevices = [ { device = "/dev/disk/by-uuid/a4e172ac-d49d-49c1-814d-54f449cf753d"; } ];
  };
in
{
  # flake.aspects.igloo.nixos = config;
  den.aspects.igloo.nixos = config;
}

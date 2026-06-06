{ self, ... }:
{
  flake.modules.nixos.cli-tools =
    { pkgs, lib, ... }:
    {
      imports = with self.modules.nixos; [
        git
        zellij
      ];

      environment.systemPackages =
        [
          pkgs.parted
        ]
        ++ lib.optional (pkgs.stdenv.hostPlatform.system == "x86_64-linux") pkgs.intel-gpu-tools;
    };
}

{
  flake.aspects = { aspects, ... }: {
    cli-tools = {
      includes = with aspects; [
        git
        zellij
      ];

      nixos =
        { pkgs, lib, ... }:
        {
          environment.systemPackages = [
            pkgs.parted
          ]
          ++ lib.optional (pkgs.stdenv.hostPlatform.system == "x86_64-linux") pkgs.intel-gpu-tools;
        };
    };
  };
}

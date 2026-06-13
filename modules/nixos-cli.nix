{ inputs, den, ... }: {
  den.aspects = {
    nixos-cli = {
      includes = with den.aspects; [
        nvd
        nix-output-monitor
      ];
      nixos = {
        imports = [
          inputs.nixos-cli.nixosModules.nixos-cli
        ];

        programs.nixos-cli = {
          enable = true;
          settings = {
            aliases = rec {
              switch = [ "apply" ];
              test = [
                "apply"
                "--no-boot"
              ];
              boot = [
                "apply"
                "--no-activate"
              ];
              build = boot ++ [
                "--no-boot"
                "--output"
                "./result"
              ];
              build-image = build ++ [ "--image" ];
              build-vm = build ++ [ "--vm" ];
              build-vm-with-bootloader = build ++ [ "--vm-with-bootloader" ];
              dry-activate = [
                "apply"
                "--dry"
              ];
              dry-build = dry-activate ++ [
                "--no-boot"
                "--no-activate"
              ];
              eval = [
                "apply"
                "--eval-only"
              ];
              list-generations = [
                "generation"
                "list"
                "--table"
              ];
            };
            color = true;

            differ = {
              tool = "command";
              command = [
                "nvd"
                "diff"
              ];
            };

            apply.use_nom = true;
            apply.reexec_as_root = true;

            rollback.enable = true;
          };
        };

        nix.settings = {
          substituters = [ "https://watersucks.cachix.org" ];
          trusted-public-keys = [ "watersucks.cachix.org-1:6gadPC5R8iLWQ3EUtfu3GFrVY7X6I4Fwz/ihW25Jbv8=" ];
        };
      };
    };
  };
}

{ inputs, ... }: {
  den.aspects.git.nixos = { self', ... }: {
    programs.git = {
      enable = true;
      package = self'.packages.git;
    };

    # persist.user.directories = [ ".config/git" ];
  };

  perSystem = { pkgs, ... }: {
    packages.git = inputs.wrappers.wrappers.git.wrap {
      inherit pkgs;

      settings.user = {
        email = "ashomalous@gmail.com";
        name = "Ashomaly";
      };
    };
  };
}

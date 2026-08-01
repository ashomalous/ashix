{
  den.aspects.sls-steam = {
    nixos = { inputs', pkgs, ... }: {
      environment.systemPackages = [
        inputs'.sls-steam.packages.default
      ];

      programs.steam.package = pkgs.steam.override {
        extraEnv.LD_AUDIT = "${inputs'.sls-steam.packages.sls-steam}/library-inject.so:${inputs'.sls-steam.packages.sls-steam}/SLSsteam.so";
      };

      persist.user.directories = [ ".config/SLSsteam" ];
    };
  };
}

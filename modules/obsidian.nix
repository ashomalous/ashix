{ den, ... }: {
  den.aspects.obsidian = {
    includes = with den.aspects; [ notes ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ obsidian ];

      persist.user.directories = [ ".config/obsidian" ];
    };
  };
}

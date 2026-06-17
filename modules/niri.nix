{ den, ... }: {
  den.aspects.niri = {
    includes = [
      den.aspects.wayland

      den.aspects.keyring
    ];

    nixos = {
      programs.niri.enable = true;

      security.polkit.enable = true;

      persist.user.directories = [ ".config/niri" ];
    };
  };
}

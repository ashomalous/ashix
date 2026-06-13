{ den, ... }: {
  den.aspects.niri = {
    includes = [
      den.aspects.wayland
    ];

    nixos = {
      programs.niri.enable = true;

      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;
    };
  };
}

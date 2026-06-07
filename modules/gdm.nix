{
  flake.aspects.gdm.nixos = {
    services.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}

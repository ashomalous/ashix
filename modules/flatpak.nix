{
  flake.aspects.flatpak.nixos = _: {
    services.flatpak.enable = true;
  };
}

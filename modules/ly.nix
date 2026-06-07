{
  flake.aspects.ly.nixos = {
    services.displayManager.ly = {
      enable = true;
      x11Support = true;
    };
  };
}

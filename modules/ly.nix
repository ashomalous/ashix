{
  flake.modules.nixos.ly = {
    services.displayManager.ly = {
      enable = true;
      x11Support = true;
    };
  };
}

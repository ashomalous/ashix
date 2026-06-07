{
  flake.aspects.gamescope.nixos = _: {
    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}

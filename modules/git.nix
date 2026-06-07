{
  flake.aspects.git.nixos = _: {
    programs.git.enable = true;
  };
}

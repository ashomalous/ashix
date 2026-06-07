{
  flake.aspects.fzf.nixos = _: {
    programs.fzf.fuzzyCompletion = true;
  };
}

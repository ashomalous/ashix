{
  den.aspects.git.nixos = _: {
    programs.git.enable = true;

    persist.user.directories = [ ".config/git" ];
  };
}

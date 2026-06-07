{
  flake.aspects = { aspects, ... }: {
    factory.provides = {
      user = username: {
        nixos = _: { users.users.${username}.isNormalUser = true; };
      };

      primaryUser = username: {
        includes = with aspects; [ (factory._.user username) ];
        nixos = _: { users.users.${username}.extraGroups = [ "wheel" ]; };
      };
    };
  };
}

{
  flake.aspects.factory.provides.user = username: {
    nixos = _: { users.users.${username}.isNormalUser = true; };
  };
}

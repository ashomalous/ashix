{
  flake.aspects.factory.provides.user = username: {
    ${username}.nixos = _: {
      users.users.${username}.isNormalUser = true;
    };
  };
}

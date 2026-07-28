{
  den.aspects.userGroups = group: { user, ... }: {
    nixos = _: {
      users.users.${user.name}.extraGroups = if (builtins.isList group) then group else [ group ];
    };
  };
}

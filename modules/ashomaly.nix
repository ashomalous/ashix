{ den, ... }: {
  den.aspects.ashomaly = {
    includes = with den.aspects; [
      den.batteries.define-user
      den.batteries.primary-user

      (defaultEditor "helix")

      (set-xkb "us" "colemak" { })
    ];

    nixos = _: {
      users.users.ashomaly.hashedPasswordFile = "/persist/passwd";
    };
  };
}

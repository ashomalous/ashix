{ den, ... }: {
  den.aspects.ashomaly = {
    includes = with den.aspects; [
      den.batteries.primary-user

      nixos-cli

      # (factory._.defaultEditor "helix")
      helix
      # neovim
      # emacs

      kitty
      yazi

      localsend
      # pass
      # blender

      # kanata

      # media

      # discord

      # development

      (set-xkb "us" "colemak" { })
    ];

    nixos = _: {
      users.users.ashomaly.hashedPasswordFile = "/persist/passwd";
    };
  };
}

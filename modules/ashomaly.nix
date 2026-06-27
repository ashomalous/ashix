{ den, ... }: {
  den.aspects.ashomaly = {
    includes = with den.aspects; [
      den.batteries.define-user
      den.batteries.primary-user

      nixos-cli

      # (factory._.defaultEditor "helix")
      helix
      # neovim
      # emacs

      kitty
      yazi

      localsend

      quickshell
      # pass
      # blender

      dunst

      # kanata

      # media

      discord
      recording

      # development

      (set-xkb "us" "colemak" { })
    ];

    nixos = _: {
      users.users.ashomaly.hashedPasswordFile = "/persist/passwd";
    };
  };
}

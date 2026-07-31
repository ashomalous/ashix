{ den, ... }: {
  den.aspects.ashomaly = {
    includes = with den.aspects; [
      den.batteries.define-user
      den.batteries.primary-user

      nixos-cli

      (defaultEditor "helix")
      # neovim
      # emacs

      kitty
      yazi

      # obsidian

      # localsend

      # quickshell
      # pass
      # blender

      # dunst
      # mako
      # rofi

      # kanata

      # media

      # discord
      # recording
      # office

      # development

      (set-xkb "us" "colemak" { })

      projects
    ];

    # nixos = _: {
    #   users.users.ashomaly.hashedPasswordFile = "/persist/passwd";
    # };
  };
}

{ den, ... }: {
  den.aspects = {
    ashomaly = {
      includes = with den.aspects; [
        den.batteries.primary-user

        nixos-cli

        # (factory._.defaultEditor "helix")
        helix
        neovim
        kitty
        yazi

        localsend
        pass
        blender

        kanata

        media

        discord

        development
      ];
    };
  };
}

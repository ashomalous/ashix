{
  den.aspects.deluge.nixos = _: {
    services.deluge.enable = true;

    persist.user.directories = [ ".config/deluge" ];
  };
}

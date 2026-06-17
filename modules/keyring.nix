{
  den.aspects.keyring.nixos = _: {
    services.gnome.gnome-keyring.enable = true;

    persist.user.directories = [
      {
        directory = ".local/share/keyrings";
        mode = "0700";
      }
    ];
  };
}

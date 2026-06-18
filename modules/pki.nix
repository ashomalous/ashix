{
  den.aspects.pki.nixos = _: {
    persist.user.directories = [
      {
        directory = ".pki";
        mode = "0700";
      }
    ];
  };
}

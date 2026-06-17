{
  den.aspects.set-xkb =
    layout: variant:
    {
      options ? "",
    }:
    {
      nixos = _: {
        services.xserver.xkb = {
          inherit layout variant options;
        };

        console.useXkbConfig = true;
      };
    };
}

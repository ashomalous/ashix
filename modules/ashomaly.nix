{
  flake.aspects =
    { aspects, ... }:
    {
      ashomaly = {
        includes = with aspects; [
          (factory._.user "ashomaly")

          nixos-cli

          (factory._.defaultEditor "helix")
          kitty
          yazi

          localsend
          pass
          blender

          kanata

          media

          discord
        ];
      };
    };
}

{
  flake.aspects.kitty.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ kitty ];
    };
}

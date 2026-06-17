{
  den.aspects.kitty.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ kitty ];

      persist.user.directories = [".config/kitty"];
    };
}

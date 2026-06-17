{
  den.aspects.helix.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ helix ];

      persist.user.directories = [".config/helix"];
    };
}

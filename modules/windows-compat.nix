{
  den.aspects.windows-compat.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wine
        protonplus
        bottles
      ];
    };
}

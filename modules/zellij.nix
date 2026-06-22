{
  den.aspects.zellij.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs.unstable; [ zellij ];

      # persist.user.directories
    };
}

{
  den.aspects.zellij.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ zellij ];
    };
}

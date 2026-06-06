{
  flake.modules.nixos.zellij =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ zellij ];
    };
}

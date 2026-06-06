{
  flake.modules.nixos.windows-compat =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wine
        protonplus
        bottles
      ];
    };
}

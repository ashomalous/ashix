{
  flake.modules.nixos.nix-output-monitor = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ nix-output-monitor ];
  };
}

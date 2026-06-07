{
  flake.aspects.nix-output-monitor.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ nix-output-monitor ];
  };
}

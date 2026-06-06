{
  flake.modules.nixos.nvd = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ nvd ];
  };
}

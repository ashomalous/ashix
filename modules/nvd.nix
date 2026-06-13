{
  den.aspects.nvd.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ nvd ];
  };
}

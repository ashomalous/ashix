{
  den.aspects.clipboard.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ wl-clipboard ];
  };
}

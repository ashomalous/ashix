{
  den.aspects.waybar.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ waybar ];
  };
}

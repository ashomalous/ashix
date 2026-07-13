{
  den.aspects.brightness.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ brightnessctl ];
  };
}

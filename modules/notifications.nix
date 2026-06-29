{
  den.aspects.notify.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ libnotify ];
  };
}

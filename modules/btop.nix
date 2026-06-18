{
  den.aspects.btop.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ btop ];

    persist.user.directories = [ ".config/btop" ];
  };
}

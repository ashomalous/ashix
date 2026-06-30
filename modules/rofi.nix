{
  den.aspects.rofi.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ rofi ];

    persist.user.directories = [ ".config/rofi" ];
  };
}

{
  den.aspects.rofi.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ rofi-wayland ];

    persist.user.directories = [".config/rofi"];
  };
}

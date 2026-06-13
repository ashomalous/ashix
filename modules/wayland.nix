{
  den.aspects.wayland.nixos = { pkgs, ... }: {
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.xwayland.enable = true;
    environment.systemPackages = with pkgs; [ xwayland-satellite ];
  };
}

{ den, ... }: {
  den.aspects.mangowc = {
    includes = with den.aspects; [ grim ];
    nixos = { pkgs, ... }: {
      programs.mangowc.enable = true;

      environment.systemPackages = with pkgs; [
        foot
        wmenu
        wl-clipboard
        slurp
        swaybg
      ];

      persist.directories = [ "/etc/mango" ];
      persist.user.directories = [ ".config/mango" ];

      xdg.portal.enable = true;
      xdg.portal.wlr.enable = true;
      xdg.autostart.enable = true;
      xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    };
  };
}

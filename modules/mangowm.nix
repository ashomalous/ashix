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
    };
  };
}

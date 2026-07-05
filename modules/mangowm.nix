{
  den.aspects.mangowc = {
    nixos = { pkgs, ... }: {
      programs.mangowc.enable = true;

      environment.systemPackages = with pkgs; [
        foot
        wmenu
        wl-clipboard
        grim
        slurp
        swaybg
      ];

      persist.directories = [ "/etc/mango" ];
      persist.user.directories = [ ".config/mango" ];
    };
  };
}

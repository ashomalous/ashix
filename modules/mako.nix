{ den, ... }: {
  den.aspects.mako = {
    includes = with den.aspects; [ notify ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ mako ];

      services.dbus.packages = with pkgs; [ mako ];

      persist.user.files = [ ".config/mako/config" ];
    };
  };
}

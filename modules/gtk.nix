{
  den.aspects.catppuccinGtk.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      (catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "mauve" ];
        tweaks = [ "rimless" ];
        size = "compact";
      })
      (catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      })
    ];

    programs.dconf.profiles.user.databases = [
      {
        lockAll = false;
        settings."org/gnome/desktop/interface" = {
          gtk-theme = "catppuccin-mocha-mauve-compact+rimless";
          icon-theme = "Papirus";
          color-scheme = "prefer-dark";
        };
      }
    ];
  };
}

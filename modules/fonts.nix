{
  den.aspects.fonts.nixos =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        noto-fonts-cjk-sans
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-mono

        noto-fonts-color-emoji

        nerd-fonts.symbols-only
      ];

      programs.dconf.profiles.user.databases = [
        {
          lockAll = false;
          settings."org/gnome/desktop/interface".font-name = "FiraMono Nerd Font 11";
        }
      ];
    };
}

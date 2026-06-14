{
  den.aspects.fonts.nixos =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        fira
        noto-fonts-cjk-sans
        nerd-fonts.jetbrains-mono

        noto-fonts-color-emoji

        nerd-fonts.symbols-only
      ];
    };
}

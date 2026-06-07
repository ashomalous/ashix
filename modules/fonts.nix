{
  flake.aspects.fonts.nixos =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        fira
        noto-fonts-cjk-sans
        nerd-fonts.jetbrains-mono
      ];
    };
}

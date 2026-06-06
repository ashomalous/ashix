{
  flake.modules.nixos.fonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        fira
        noto-fonts-cjk-sans
        nerd-fonts.jetbrains-mono
      ];
    };
}

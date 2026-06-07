{
  flake.aspects.media.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        pear-desktop # yt music
        easyeffects
        gnomeExtensions.easyeffects-preset-selector
        mpv
      ];
    };
}

{
  flake.modules.nixos.media =
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

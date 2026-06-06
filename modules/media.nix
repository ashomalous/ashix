{
  flake.modules.nixos.media =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        youtube-music
        easyeffects
        gnomeExtensions.easyeffects-preset-selector
        mpv
      ];
    };
}

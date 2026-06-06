{
  flake.modules.nixos.office =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        pdfarranger
        libreoffice-qt6
        gimp3-with-plugins
      ];
    };
}

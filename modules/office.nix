{
  den.aspects.office.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        pdfarranger
        libreoffice-qt6
        gimp3-with-plugins
      ];
    };
}

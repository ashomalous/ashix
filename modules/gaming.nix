{ self, ... }:
{
  flake.modules.nixos.gaming =
    { pkgs, ... }:
    {
      imports = with self.modules.nixos; [
        windows-compat

        steam
        gamescope
        gamemode
      ];

      environment.systemPackages = with pkgs; [
        heroic
        mangohud
        goverlay
        joystickwake
        lutris
        umu-launcher
        faugus-launcher
      ];
    };
}

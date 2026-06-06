{ self, ... }:
{
  flake.modules.nixos.igloo = {
    imports = with self.modules.nixos; [
      system-desktop
      systemd-boot
      quietBoot
      bluetooth

      niri
      dank-material-shell
      ly

      gaming

      flatpak

      ashomaly
    ];
  };
}

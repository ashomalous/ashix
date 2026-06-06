{ self, ... }:
{
  flake.modules.nixos.system-default = {
    imports = with self.modules.nixos; [
      system-minimal

      power-management
      networking
      locale
      comma
    ];
  };
}

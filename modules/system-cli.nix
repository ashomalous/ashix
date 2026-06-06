{ self, ... }:
{
  flake.modules.nixos.system-cli = {
    imports = with self.modules.nixos; [
      system-default

      ssh
      firmware
      cli-tools

      shell

      fonts
    ];
  };
}

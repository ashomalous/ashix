{ self, ... }:
{
  flake.modules = self.factory.user "ashomaly" true {
    imports = with self.modules.nixos; [
      helix
      kitty
      yazi

      localsend
      pass
      blender

      kanata

      media
    ];

    users.users.ashomaly.extraGroups = [ "uinput" ];
  };
}

{ lib, ... }:
{
  config.flake.factory.user = username: isAdmin: extraConfig: {
    nixos.${username} = lib.mkMerge [
      {
        users.users.${username} = {
          isNormalUser = true;
          home = "/home/${username}";
          extraGroups = lib.optional isAdmin "wheel";
        };
      }
      extraConfig
    ];
  };

}

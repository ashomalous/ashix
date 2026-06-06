{ self, ... }:
{
  flake.modules.nixos.pass =
    { pkgs, ... }:
    {
      imports = with self.modules.nixos; [ gnupg ];

      environment.systemPackages = with pkgs; [ pass ];
    };
}

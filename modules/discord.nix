{
  flake.modules.nixos.discord = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ vesktop ];
  };
  flake.modules.nixos.discord-tui = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ discordo ];
  };
}

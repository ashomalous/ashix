{
  flake.aspects.discord.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ vesktop ];
  };
  flake.aspects.discord-tui.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ discordo ];
  };
}

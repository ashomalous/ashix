{
  den.aspects.discord.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ vesktop ];

    persist.user.directories = [ ".config/vesktop" ];
  };
  den.aspects.discord-tui.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ discordo ];
  };
}

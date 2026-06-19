{
  den.aspects.quickshell.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ quickshell ];

    persist.user.directories = [ ".config/quickshell" ];
  };
}

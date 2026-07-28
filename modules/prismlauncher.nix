{
  den.aspects.prismlauncher.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      (prismlauncher.override {
        additionalPrograms = [ ffmpeg ];
      })
    ];

    persist.user.directories = [".local/share/PrismLauncher"];
  };
}

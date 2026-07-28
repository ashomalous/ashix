{
  den.aspects.prismlauncher.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      (prismlauncher.override {
        additionalPrograms = [ ffmpeg ];
      })
    ];
  };
}

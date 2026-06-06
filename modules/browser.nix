{ inputs, ... }: {
  flake.modules.nixos.firefox =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ firefox ];
    };

  flake.modules.nixos.zen-browser =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}

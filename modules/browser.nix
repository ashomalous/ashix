{ inputs, ... }: {
  flake.aspects.firefox.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ firefox ];
    };

  flake.aspects.zen-browser.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}

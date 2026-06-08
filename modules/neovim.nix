{
  flake.aspects.neovim.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      neovim

      # dependencies
      git
      unzip
      gcc
      gnumake
      ripgrep
      fd
      tree-sitter
    ];
  };
}
